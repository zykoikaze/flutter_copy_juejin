// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_list_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityListCell _$CityListCellFromJson(Map<String, dynamic> json) {
  return CityListCell(
    cityAlias: json['cityAlias'] as String,
    cityName: json['cityName'] as String,
    weight: json['weight'] as int,
  );
}

Map<String, dynamic> _$CityListCellToJson(CityListCell instance) =>
    <String, dynamic>{
      'cityAlias': instance.cityAlias,
      'cityName': instance.cityName,
      'weight': instance.weight,
    };
