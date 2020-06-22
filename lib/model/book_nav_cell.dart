import 'package:json_annotation/json_annotation.dart';
part 'book_nav_cell.g.dart';
@JsonSerializable()
class BookNavCell{
  String alias;
  String createAt;
  String id;
  String name;
  String score;
  BookNavCell({
    this.alias,
    this.createAt,
    this.id,
    this.name,
    this.score
  });
  //反序列化
  factory BookNavCell.fromJson(Map<String, dynamic> json) => _$BookNavCellFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$BookNavCellToJson(this);
}