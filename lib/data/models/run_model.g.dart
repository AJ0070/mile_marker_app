// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'run_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRunModelCollection on Isar {
  IsarCollection<RunModel> get runModels => this.collection();
}

const RunModelSchema = CollectionSchema(
  name: r'RunModel',
  id: -5182072751449766209,
  properties: {
    r'areaName': PropertySchema(
      id: 0,
      name: r'areaName',
      type: IsarType.string,
    ),
    r'distanceInMeters': PropertySchema(
      id: 1,
      name: r'distanceInMeters',
      type: IsarType.double,
    ),
    r'durationInSeconds': PropertySchema(
      id: 2,
      name: r'durationInSeconds',
      type: IsarType.long,
    ),
    r'endTime': PropertySchema(
      id: 3,
      name: r'endTime',
      type: IsarType.dateTime,
    ),
    r'pathJson': PropertySchema(
      id: 4,
      name: r'pathJson',
      type: IsarType.string,
    ),
    r'startTime': PropertySchema(
      id: 5,
      name: r'startTime',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _runModelEstimateSize,
  serialize: _runModelSerialize,
  deserialize: _runModelDeserialize,
  deserializeProp: _runModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _runModelGetId,
  getLinks: _runModelGetLinks,
  attach: _runModelAttach,
  version: '3.1.0',
);

int _runModelEstimateSize(
  RunModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.areaName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.pathJson.length * 3;
  return bytesCount;
}

void _runModelSerialize(
  RunModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.areaName);
  writer.writeDouble(offsets[1], object.distanceInMeters);
  writer.writeLong(offsets[2], object.durationInSeconds);
  writer.writeDateTime(offsets[3], object.endTime);
  writer.writeString(offsets[4], object.pathJson);
  writer.writeDateTime(offsets[5], object.startTime);
}

RunModel _runModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RunModel();
  object.areaName = reader.readStringOrNull(offsets[0]);
  object.distanceInMeters = reader.readDouble(offsets[1]);
  object.durationInSeconds = reader.readLong(offsets[2]);
  object.endTime = reader.readDateTimeOrNull(offsets[3]);
  object.id = id;
  object.pathJson = reader.readString(offsets[4]);
  object.startTime = reader.readDateTime(offsets[5]);
  return object;
}

P _runModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _runModelGetId(RunModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _runModelGetLinks(RunModel object) {
  return [];
}

void _runModelAttach(IsarCollection<dynamic> col, Id id, RunModel object) {
  object.id = id;
}

extension RunModelQueryWhereSort on QueryBuilder<RunModel, RunModel, QWhere> {
  QueryBuilder<RunModel, RunModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RunModelQueryWhere on QueryBuilder<RunModel, RunModel, QWhereClause> {
  QueryBuilder<RunModel, RunModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RunModelQueryFilter
    on QueryBuilder<RunModel, RunModel, QFilterCondition> {
  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'areaName',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'areaName',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'areaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'areaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'areaName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'areaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'areaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'areaName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'areaName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'areaName',
        value: '',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> areaNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'areaName',
        value: '',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      distanceInMetersEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distanceInMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      distanceInMetersGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distanceInMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      distanceInMetersLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distanceInMeters',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      distanceInMetersBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distanceInMeters',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      durationInSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      durationInSecondsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      durationInSecondsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationInSeconds',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition>
      durationInSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationInSeconds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> endTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> endTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endTime',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> endTimeEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> endTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> endTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> endTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathJson',
        value: '',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> pathJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathJson',
        value: '',
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> startTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> startTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> startTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startTime',
        value: value,
      ));
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterFilterCondition> startTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RunModelQueryObject
    on QueryBuilder<RunModel, RunModel, QFilterCondition> {}

extension RunModelQueryLinks
    on QueryBuilder<RunModel, RunModel, QFilterCondition> {}

extension RunModelQuerySortBy on QueryBuilder<RunModel, RunModel, QSortBy> {
  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByAreaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaName', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByAreaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaName', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByDistanceInMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceInMeters', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByDistanceInMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceInMeters', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByPathJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathJson', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByPathJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathJson', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> sortByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension RunModelQuerySortThenBy
    on QueryBuilder<RunModel, RunModel, QSortThenBy> {
  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByAreaName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaName', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByAreaNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'areaName', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByDistanceInMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceInMeters', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByDistanceInMetersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'distanceInMeters', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByDurationInSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationInSeconds', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByEndTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endTime', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByPathJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathJson', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByPathJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathJson', Sort.desc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.asc);
    });
  }

  QueryBuilder<RunModel, RunModel, QAfterSortBy> thenByStartTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startTime', Sort.desc);
    });
  }
}

extension RunModelQueryWhereDistinct
    on QueryBuilder<RunModel, RunModel, QDistinct> {
  QueryBuilder<RunModel, RunModel, QDistinct> distinctByAreaName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'areaName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RunModel, RunModel, QDistinct> distinctByDistanceInMeters() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'distanceInMeters');
    });
  }

  QueryBuilder<RunModel, RunModel, QDistinct> distinctByDurationInSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationInSeconds');
    });
  }

  QueryBuilder<RunModel, RunModel, QDistinct> distinctByEndTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endTime');
    });
  }

  QueryBuilder<RunModel, RunModel, QDistinct> distinctByPathJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RunModel, RunModel, QDistinct> distinctByStartTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startTime');
    });
  }
}

extension RunModelQueryProperty
    on QueryBuilder<RunModel, RunModel, QQueryProperty> {
  QueryBuilder<RunModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RunModel, String?, QQueryOperations> areaNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'areaName');
    });
  }

  QueryBuilder<RunModel, double, QQueryOperations> distanceInMetersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'distanceInMeters');
    });
  }

  QueryBuilder<RunModel, int, QQueryOperations> durationInSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationInSeconds');
    });
  }

  QueryBuilder<RunModel, DateTime?, QQueryOperations> endTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endTime');
    });
  }

  QueryBuilder<RunModel, String, QQueryOperations> pathJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathJson');
    });
  }

  QueryBuilder<RunModel, DateTime, QQueryOperations> startTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetExploredTileCollection on Isar {
  IsarCollection<ExploredTile> get exploredTiles => this.collection();
}

const ExploredTileSchema = CollectionSchema(
  name: r'ExploredTile',
  id: 8103763380517913998,
  properties: {
    r'firstExploredAt': PropertySchema(
      id: 0,
      name: r'firstExploredAt',
      type: IsarType.dateTime,
    ),
    r'tileMapKey': PropertySchema(
      id: 1,
      name: r'tileMapKey',
      type: IsarType.string,
    )
  },
  estimateSize: _exploredTileEstimateSize,
  serialize: _exploredTileSerialize,
  deserialize: _exploredTileDeserialize,
  deserializeProp: _exploredTileDeserializeProp,
  idName: r'id',
  indexes: {
    r'tileMapKey': IndexSchema(
      id: -542916988178192902,
      name: r'tileMapKey',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'tileMapKey',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _exploredTileGetId,
  getLinks: _exploredTileGetLinks,
  attach: _exploredTileAttach,
  version: '3.1.0',
);

int _exploredTileEstimateSize(
  ExploredTile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.tileMapKey.length * 3;
  return bytesCount;
}

void _exploredTileSerialize(
  ExploredTile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.firstExploredAt);
  writer.writeString(offsets[1], object.tileMapKey);
}

ExploredTile _exploredTileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExploredTile();
  object.firstExploredAt = reader.readDateTime(offsets[0]);
  object.id = id;
  object.tileMapKey = reader.readString(offsets[1]);
  return object;
}

P _exploredTileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _exploredTileGetId(ExploredTile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _exploredTileGetLinks(ExploredTile object) {
  return [];
}

void _exploredTileAttach(
    IsarCollection<dynamic> col, Id id, ExploredTile object) {
  object.id = id;
}

extension ExploredTileByIndex on IsarCollection<ExploredTile> {
  Future<ExploredTile?> getByTileMapKey(String tileMapKey) {
    return getByIndex(r'tileMapKey', [tileMapKey]);
  }

  ExploredTile? getByTileMapKeySync(String tileMapKey) {
    return getByIndexSync(r'tileMapKey', [tileMapKey]);
  }

  Future<bool> deleteByTileMapKey(String tileMapKey) {
    return deleteByIndex(r'tileMapKey', [tileMapKey]);
  }

  bool deleteByTileMapKeySync(String tileMapKey) {
    return deleteByIndexSync(r'tileMapKey', [tileMapKey]);
  }

  Future<List<ExploredTile?>> getAllByTileMapKey(
      List<String> tileMapKeyValues) {
    final values = tileMapKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'tileMapKey', values);
  }

  List<ExploredTile?> getAllByTileMapKeySync(List<String> tileMapKeyValues) {
    final values = tileMapKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'tileMapKey', values);
  }

  Future<int> deleteAllByTileMapKey(List<String> tileMapKeyValues) {
    final values = tileMapKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'tileMapKey', values);
  }

  int deleteAllByTileMapKeySync(List<String> tileMapKeyValues) {
    final values = tileMapKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'tileMapKey', values);
  }

  Future<Id> putByTileMapKey(ExploredTile object) {
    return putByIndex(r'tileMapKey', object);
  }

  Id putByTileMapKeySync(ExploredTile object, {bool saveLinks = true}) {
    return putByIndexSync(r'tileMapKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByTileMapKey(List<ExploredTile> objects) {
    return putAllByIndex(r'tileMapKey', objects);
  }

  List<Id> putAllByTileMapKeySync(List<ExploredTile> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'tileMapKey', objects, saveLinks: saveLinks);
  }
}

extension ExploredTileQueryWhereSort
    on QueryBuilder<ExploredTile, ExploredTile, QWhere> {
  QueryBuilder<ExploredTile, ExploredTile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ExploredTileQueryWhere
    on QueryBuilder<ExploredTile, ExploredTile, QWhereClause> {
  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause> tileMapKeyEqualTo(
      String tileMapKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tileMapKey',
        value: [tileMapKey],
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterWhereClause>
      tileMapKeyNotEqualTo(String tileMapKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tileMapKey',
              lower: [],
              upper: [tileMapKey],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tileMapKey',
              lower: [tileMapKey],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tileMapKey',
              lower: [tileMapKey],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tileMapKey',
              lower: [],
              upper: [tileMapKey],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ExploredTileQueryFilter
    on QueryBuilder<ExploredTile, ExploredTile, QFilterCondition> {
  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      firstExploredAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstExploredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      firstExploredAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstExploredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      firstExploredAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstExploredAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      firstExploredAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstExploredAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tileMapKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tileMapKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tileMapKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tileMapKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tileMapKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tileMapKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tileMapKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tileMapKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tileMapKey',
        value: '',
      ));
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterFilterCondition>
      tileMapKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tileMapKey',
        value: '',
      ));
    });
  }
}

extension ExploredTileQueryObject
    on QueryBuilder<ExploredTile, ExploredTile, QFilterCondition> {}

extension ExploredTileQueryLinks
    on QueryBuilder<ExploredTile, ExploredTile, QFilterCondition> {}

extension ExploredTileQuerySortBy
    on QueryBuilder<ExploredTile, ExploredTile, QSortBy> {
  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy>
      sortByFirstExploredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstExploredAt', Sort.asc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy>
      sortByFirstExploredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstExploredAt', Sort.desc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy> sortByTileMapKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tileMapKey', Sort.asc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy>
      sortByTileMapKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tileMapKey', Sort.desc);
    });
  }
}

extension ExploredTileQuerySortThenBy
    on QueryBuilder<ExploredTile, ExploredTile, QSortThenBy> {
  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy>
      thenByFirstExploredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstExploredAt', Sort.asc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy>
      thenByFirstExploredAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstExploredAt', Sort.desc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy> thenByTileMapKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tileMapKey', Sort.asc);
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QAfterSortBy>
      thenByTileMapKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tileMapKey', Sort.desc);
    });
  }
}

extension ExploredTileQueryWhereDistinct
    on QueryBuilder<ExploredTile, ExploredTile, QDistinct> {
  QueryBuilder<ExploredTile, ExploredTile, QDistinct>
      distinctByFirstExploredAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstExploredAt');
    });
  }

  QueryBuilder<ExploredTile, ExploredTile, QDistinct> distinctByTileMapKey(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tileMapKey', caseSensitive: caseSensitive);
    });
  }
}

extension ExploredTileQueryProperty
    on QueryBuilder<ExploredTile, ExploredTile, QQueryProperty> {
  QueryBuilder<ExploredTile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ExploredTile, DateTime, QQueryOperations>
      firstExploredAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstExploredAt');
    });
  }

  QueryBuilder<ExploredTile, String, QQueryOperations> tileMapKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tileMapKey');
    });
  }
}
