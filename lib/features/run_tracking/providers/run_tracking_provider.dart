import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class RunTrackingState {
  final bool isTracking;
  final double distanceInMeters;
  final int durationInSeconds;
  final List<LatLng> routeMap;

  RunTrackingState({
    required this.isTracking,
    required this.distanceInMeters,
    required this.durationInSeconds,
    required this.routeMap,
  });

  RunTrackingState copyWith({
    bool? isTracking,
    double? distanceInMeters,
    int? durationInSeconds,
    List<LatLng>? routeMap,
  }) {
    return RunTrackingState(
      isTracking: isTracking ?? this.isTracking,
      distanceInMeters: distanceInMeters ?? this.distanceInMeters,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
      routeMap: routeMap ?? this.routeMap,
    );
  }

  // Derived properties for UI
  double get distanceInKm => distanceInMeters / 1000.0;

  String get formattedTime {
    final minutes = (durationInSeconds / 60).floor().toString().padLeft(2, '0');
    final seconds = (durationInSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get formattedPace {
    if (distanceInKm == 0 || durationInSeconds == 0) return '0:00';
    // Pace is typically given as minutes per km
    final paceInSeconds = durationInSeconds / distanceInKm;
    final pMinutes = (paceInSeconds / 60).floor().toString();
    final pSeconds = (paceInSeconds % 60).floor().toString().padLeft(2, '0');
    return '$pMinutes:$pSeconds';
  }
}

class RunTrackingNotifier extends StateNotifier<RunTrackingState> {
  RunTrackingNotifier()
    : super(
        RunTrackingState(
          isTracking: false,
          distanceInMeters: 0.0,
          durationInSeconds: 0,
          routeMap: [],
        ),
      );

  Timer? _timer;
  StreamSubscription<Position>? _positionStream;

  void startRun() async {
    // 1. Reset state
    state = RunTrackingState(
      isTracking: true,
      distanceInMeters: 0.0,
      durationInSeconds: 0,
      routeMap: [],
    );

    // 2. Start Foreground Service (Optional but recommended for reliability)
    final service = FlutterBackgroundService();
    if (!await service.isRunning()) {
      await service.startService();
    }

    // 3. Start Timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        state = state.copyWith(durationInSeconds: state.durationInSeconds + 1);
      }
    });

    // 4. Start Location Listener
    _positionStream =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.bestForNavigation,
            distanceFilter: 5, // Requires 5 meters of movement to fire
          ),
        ).listen((Position position) {
          if (!mounted) return;

          final newPoint = LatLng(position.latitude, position.longitude);
          final newMap = List<LatLng>.from(state.routeMap)..add(newPoint);

          double newDistance = state.distanceInMeters;

          // If we already have a previous point, calculate the delta
          if (state.routeMap.isNotEmpty) {
            final lastPoint = state.routeMap.last;
            newDistance += const Distance().distance(lastPoint, newPoint);
          }

          state = state.copyWith(
            distanceInMeters: newDistance,
            routeMap: newMap,
          );
        });
  }

  void stopRun() async {
    _timer?.cancel();
    _positionStream?.cancel();

    // Attempt to stop foreground service if we started it
    final service = FlutterBackgroundService();
    if (await service.isRunning()) {
      service.invoke("stopService");
    }

    state = state.copyWith(isTracking: false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _positionStream?.cancel();
    super.dispose();
  }
}

final runTrackingProvider =
    StateNotifierProvider<RunTrackingNotifier, RunTrackingState>((ref) {
      return RunTrackingNotifier();
    });
