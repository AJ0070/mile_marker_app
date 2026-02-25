import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/run_model.dart';
import '../../../data/providers/app_providers.dart';
import '../providers/run_tracking_provider.dart';

class LiveRunScreen extends ConsumerStatefulWidget {
  const LiveRunScreen({super.key});

  @override
  ConsumerState<LiveRunScreen> createState() => _LiveRunScreenState();
}

class _LiveRunScreenState extends ConsumerState<LiveRunScreen> {
  bool _isLoading = true;
  final MapController _mapController = MapController();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) setState(() => _isLoading = false);
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    if (mounted) {
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
        _isLoading = false;
      });
    }

    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation,
        distanceFilter: 5,
      ),
    ).listen((Position position) {
      if (!mounted) return;
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
      try {
        _mapController.move(_currentLocation!, 16.0);
      } catch (e) {
        // ignore if not mounted
      }
    });
  }

  void _toggleTracking(bool isTracking) async {
    if (isTracking) {
      // STOPPING the run:
      final currentState = ref.read(runTrackingProvider);

      // Stop tracking math
      ref.read(runTrackingProvider.notifier).stopRun();

      // Only save if they actually moved some distance (e.g., > 10 meters)
      // Otherwise avoid littering DB with 0km runs
      if (currentState.distanceInMeters >= 10) {
        final pathJson = jsonEncode(
          currentState.routeMap
              .map(
                (latLng) => {'lat': latLng.latitude, 'lng': latLng.longitude},
              )
              .toList(),
        );

        final runModel = RunModel()
          ..startTime = DateTime.now().subtract(
            Duration(seconds: currentState.durationInSeconds),
          )
          ..endTime = DateTime.now()
          ..distanceInMeters = currentState.distanceInMeters
          ..durationInSeconds = currentState.durationInSeconds
          ..pathJson = pathJson;

        final localStorage = ref.read(localStorageProvider);
        await localStorage.saveRun(runModel);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Run saved to Activity History!')),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Run discarded (Distance too short).'),
            ),
          );
        }
      }
    } else {
      // STARTING the run:
      ref.read(runTrackingProvider.notifier).startRun();
    }
  }

  @override
  Widget build(BuildContext context) {
    final trackingState = ref.watch(runTrackingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Tracking'),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _currentLocation == null
          ? const Center(child: Text('Location unavailable'))
          : Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _currentLocation!,
                    initialZoom: 16.0,
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all,
                    ),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.jashambaliya.milemarker',
                      tileBuilder: (context, widget, tile) {
                        return ColorFiltered(
                          colorFilter: const ColorFilter.matrix([
                            -1,
                            0,
                            0,
                            0,
                            255,
                            0,
                            -1,
                            0,
                            0,
                            255,
                            0,
                            0,
                            -1,
                            0,
                            255,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ]),
                          child: widget,
                        );
                      },
                    ),
                    PolylineLayer(
                      polylines: [
                        if (trackingState.routeMap.isNotEmpty)
                          Polyline(
                            points: trackingState.routeMap,
                            strokeWidth: 6.0,
                            color: AppTheme.mapTrailColor,
                          ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: _currentLocation!,
                          width: 24,
                          height: 24,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primary.withValues(
                                    alpha: 0.5,
                                  ),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Bottom Stats Panel
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildRunStat(
                              'Distance',
                              trackingState.distanceInKm.toStringAsFixed(2),
                              'km',
                            ),
                            _buildRunStat(
                              'Time',
                              trackingState.formattedTime,
                              'min',
                            ),
                            _buildRunStat(
                              'Pace',
                              trackingState.formattedPace,
                              '/km',
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () =>
                                _toggleTracking(trackingState.isTracking),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: trackingState.isTracking
                                  ? Colors.redAccent
                                  : AppTheme.primary,
                              foregroundColor: trackingState.isTracking
                                  ? Colors.white
                                  : AppTheme.background,
                            ),
                            child: Text(
                              trackingState.isTracking
                                  ? 'STOP RUN'
                                  : 'START RUN',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildRunStat(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          unit,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppTheme.primary),
        ),
      ],
    );
  }
}
