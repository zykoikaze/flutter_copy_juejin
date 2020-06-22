import 'package:json_annotation/json_annotation.dart';
part 'city_list_cell.g.dart';
@JsonSerializable()
class CityListCell{
  String cityAlias;
  String cityName;
  int weight;
  CityListCell({
    this.cityAlias,
    this.cityName,
    this.weight
  });
  factory CityListCell.fromJson(Map<String, dynamic> json) => _$CityListCellFromJson(json);
  Map<String, dynamic> toJson()=> _$CityListCellToJson(this);
}