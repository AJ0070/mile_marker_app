import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/providers/app_providers.dart';
import 'dart:math' as math;

class TerritoryMapScreen extends ConsumerStatefulWidget {
  const TerritoryMapScreen({super.key});

  @override
  ConsumerState<TerritoryMapScreen> createState() => _TerritoryMapScreenState();
}

class _TerritoryMapScreenState extends ConsumerState<TerritoryMapScreen> {
  final MapController _mapController = MapController();

  // Helper sinh function since Dart's math library doesn't have it built-in
  double _sinh(double x) {
    return (math.exp(x) - math.exp(-x)) / 2.0;
  }

  // Helper to convert "z_x_y" back to a bounding LatLng for Map Polygons
  List<LatLng> _getTileBounds(String quadKey) {
    try {
      final parts = quadKey.split('_');
      final z = int.parse(parts[0]);
      final x = int.parse(parts[1]);
      final y = int.parse(parts[2]);

      final n = math.pow(2.0, z);
      final lonDegLeft = x / n * 360.0 - 180.0;
      final latRadTop = math.atan(_sinh(math.pi * (1 - 2 * y / n)));
      final latDegTop = latRadTop * 180.0 / math.pi;

      final lonDegRight = (x + 1) / n * 360.0 - 180.0;
      final latRadBottom = math.atan(_sinh(math.pi * (1 - 2 * (y + 1) / n)));
      final latDegBottom = latRadBottom * 180.0 / math.pi;

      return [
        LatLng(latDegTop, lonDegLeft),
        LatLng(latDegTop, lonDegRight),
        LatLng(latDegBottom, lonDegRight),
        LatLng(latDegBottom, lonDegLeft),
      ];
    } catch (_) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final exploredTilesAsync = ref.watch(exploredTilesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Territory')),
      body: exploredTilesAsync.when(
        data: (tiles) {
          final polygons = tiles.map((quadKey) {
            final bounds = _getTileBounds(quadKey);
            return Polygon(
              points: bounds,
              color: AppTheme.territoryExploredColor.withValues(alpha: 0.4),
              borderColor: AppTheme.territoryExploredColor,
              borderStrokeWidth: 1.0,
            );
          }).toList();

          return Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: const MapOptions(
                  initialCenter: LatLng(51.5, -0.09), // Default location
                  initialZoom: 14.0,
                  interactionOptions: InteractionOptions(
                    flags: InteractiveFlag.all,
                  ),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
                    subdomains: const ['a', 'b', 'c', 'd'],
                    userAgentPackageName: 'dev.jashambaliya.milemarker',
                  ),
                  PolygonLayer(polygons: polygons),
                ],
              ),
              // Stats Overlay
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStat('Explored', '${tiles.length}', 'tiles'),
                        _buildStat('City Coverage', '0.04%', ''),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            Center(child: Text('Error loading territory: $err')),
      ),
    );
  }

  Widget _buildStat(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          unit,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppTheme.primary),
        ),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
