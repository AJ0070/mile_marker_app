import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/local_storage_service.dart';

// Provides the singleton instance of the LocalStorageService.
// Requires initialization in main.dart before true usage.
final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

// A future provider to get all explored tiles for map plotting
final exploredTilesProvider = FutureProvider<List<String>>((ref) async {
  final service = ref.read(localStorageProvider);
  return await service.getExploredTiles();
});

// A future provider to get all runs for history/stats
final allRunsProvider = FutureProvider((ref) async {
  final service = ref.read(localStorageProvider);
  return await service.getAllRuns();
});
