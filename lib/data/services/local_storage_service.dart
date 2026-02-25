import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/run_model.dart';

class LocalStorageService {
  late Isar _isar;

  Isar get isar => _isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([
      RunModelSchema,
      ExploredTileSchema,
    ], directory: dir.path);
  }

  Future<void> saveRun(RunModel run) async {
    await _isar.writeTxn(() async {
      await _isar.runModels.put(run);
    });
  }

  Future<List<RunModel>> getAllRuns() async {
    return await _isar.runModels.where().findAll();
  }

  Future<void> addExploredTiles(List<String> tileKeys) async {
    final tiles = tileKeys
        .map(
          (key) => ExploredTile()
            ..tileMapKey = key
            ..firstExploredAt = DateTime.now(),
        )
        .toList();

    await _isar.writeTxn(() async {
      await _isar.exploredTiles.putAll(tiles);
    });
  }

  Future<List<String>> getExploredTiles() async {
    final tiles = await _isar.exploredTiles.where().findAll();
    return tiles.map((e) => e.tileMapKey).toList();
  }
}
