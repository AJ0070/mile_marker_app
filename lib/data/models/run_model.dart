import 'package:isar/isar.dart';

part 'run_model.g.dart';

@collection
class RunModel {
  Id id = Isar.autoIncrement;

  late DateTime startTime;
  DateTime? endTime;

  // Total distance in meters
  late double distanceInMeters;

  // Total duration in seconds
  late int durationInSeconds;

  // Storing the path as JSON string of LatLng points
  late String pathJson;

  // Bounding Box or general area string representing where they ran
  String? areaName;
}

@collection
class ExploredTile {
  Id id = Isar.autoIncrement;

  // Format: "z_x_y" e.g., "18_12534_45321" representing the quadkey/tile coordinate
  @Index(unique: true, replace: true)
  late String tileMapKey;

  late DateTime firstExploredAt;
}
