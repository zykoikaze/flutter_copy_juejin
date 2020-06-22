// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_nav_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookNavCell _$BookNavCellFromJson(Map<String, dynamic> json) {
  return BookNavCell(
    alias: json['alias'] as String,
    createAt: json['createAt'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    score: json['score'] as String,
  );
}

Map<String, dynamic> _$BookNavCellToJson(BookNavCell instance) =>
    <String, dynamic>{
      'alias': instance.alias,
      'createAt': instance.createAt,
      'id': instance.id,
      'name': instance.name,
      'score': instance.score,
    };
