import 'package:json_annotation/json_annotation.dart';
part 'activity_list_cell.g.dart';
@JsonSerializable()
class ActivityListCell{
  String bannerEndTime;
  String bannerStartTime;
  String category;
  String city;
  String cityAlias;
  String content;
  String createdAt;
  String endTime;
  String eventUrl;
  String screenshot;
  int showBanner;
  String startTime;
  List<String> tag;
  List<Map<String,dynamic>> tagInfo;
  String title;
  String updatedAt;
  String userId;
  ActivityListCell({
    this.bannerEndTime,
    this.bannerStartTime,
    this.category,
    this.city,
    this.cityAlias,
    this.content,
    this.createdAt,
    this.endTime,
    this.eventUrl,
    this.screenshot,
    this.showBanner,
    this.tag,
    this.tagInfo,
    this.title,
    this.updatedAt,
    this.userId
  });

  factory ActivityListCell.fromJson(Map<String, dynamic> json) => _$ActivityListCellFromJson(json);
  Map<String, dynamic> toJson() =>  _$ActivityListCellToJson(this);
}