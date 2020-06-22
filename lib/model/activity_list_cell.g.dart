// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_list_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityListCell _$ActivityListCellFromJson(Map<String, dynamic> json) {
  return ActivityListCell(
    bannerEndTime: json['bannerEndTime'] as String,
    bannerStartTime: json['bannerStartTime'] as String,
    category: json['category'] as String,
    city: json['city'] as String,
    cityAlias: json['cityAlias'] as String,
    content: json['content'] as String,
    createdAt: json['createdAt'] as String,
    endTime: json['endTime'] as String,
    eventUrl: json['eventUrl'] as String,
    screenshot: json['screenshot'] as String,
    showBanner: json['showBanner'] as int,
    tag: (json['tag'] as List)?.map((e) => e as String)?.toList(),
    tagInfo: (json['tagInfo'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    title: json['title'] as String,
    updatedAt: json['updatedAt'] as String,
    userId: json['userId'] as String,
  )..startTime = json['startTime'] as String;
}

Map<String, dynamic> _$ActivityListCellToJson(ActivityListCell instance) =>
    <String, dynamic>{
      'bannerEndTime': instance.bannerEndTime,
      'bannerStartTime': instance.bannerStartTime,
      'category': instance.category,
      'city': instance.city,
      'cityAlias': instance.cityAlias,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'endTime': instance.endTime,
      'eventUrl': instance.eventUrl,
      'screenshot': instance.screenshot,
      'showBanner': instance.showBanner,
      'startTime': instance.startTime,
      'tag': instance.tag,
      'tagInfo': instance.tagInfo,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'userId': instance.userId,
    };
