import 'package:json_annotation/json_annotation.dart';
part 'pins_cell.g.dart';
@JsonSerializable()
class PinsCell{
  String id;
  String content;
  String createdAt;
  int commentCount;
  int likeCount;
  bool isTopicRecommend;
	String updatedAt;
  bool viewerHasLiked;
	List<String> pictures;
  Map<String,dynamic> topic;
  User user;
  PinsCell({
    this.id,
    this.content,
    this.createdAt,
    this.commentCount,
    this.likeCount,
    this.isTopicRecommend,
    this.updatedAt,
    this.viewerHasLiked,
    this.pictures,
    this.topic,
    this.user
  });

  //反序列化
  factory PinsCell.fromJson(Map<String, dynamic> json) => _$PinsCellFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$PinsCellToJson(this);
}
@JsonSerializable()
class User{
  String id;
  String avatarLarge;
  String username;
  String company;
  String jobTitle;
  User({
    this.id,
    this.avatarLarge,
    this.username,
    this.company,
    this.jobTitle
  });
   //反序列化
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$UserToJson(this);
}