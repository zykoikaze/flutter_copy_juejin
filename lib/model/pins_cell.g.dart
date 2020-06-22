// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pins_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinsCell _$PinsCellFromJson(Map<String, dynamic> json) {
  return PinsCell(
    id: json['id'] as String,
    content: json['content'] as String,
    createdAt: json['createdAt'] as String,
    commentCount: json['commentCount'] as int,
    likeCount: json['likeCount'] as int,
    isTopicRecommend: json['isTopicRecommend'] as bool,
    updatedAt: json['updatedAt'] as String,
    viewerHasLiked: json['viewerHasLiked'] as bool,
    pictures: (json['pictures'] as List)?.map((e) => e as String)?.toList(),
    topic: json['topic'] as Map<String, dynamic>,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PinsCellToJson(PinsCell instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'commentCount': instance.commentCount,
      'likeCount': instance.likeCount,
      'isTopicRecommend': instance.isTopicRecommend,
      'updatedAt': instance.updatedAt,
      'viewerHasLiked': instance.viewerHasLiked,
      'pictures': instance.pictures,
      'topic': instance.topic,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    avatarLarge: json['avatarLarge'] as String,
    username: json['username'] as String,
    company: json['company'] as String,
    jobTitle: json['jobTitle'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'avatarLarge': instance.avatarLarge,
      'username': instance.username,
      'company': instance.company,
      'jobTitle': instance.jobTitle,
    };
