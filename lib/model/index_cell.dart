import '../util/util.dart';
class IndexCell{
  bool hot;
  String isCollection;
  String tag;
  String username;
  int collectionCount;
  int commentsCount;
  String title;
  String createTime;
  String detailUrl;
  IndexCell({
    this.hot,
    this.isCollection,
    this.tag,
    this.username,
    this.collectionCount,
    this.commentsCount,
    this.title,
    this.createTime,
    this.detailUrl
  });
  factory IndexCell.fromJson(Map json){
    return IndexCell(
      hot: json['hot'],
      isCollection:json['type'],
      tag: json['tags'].map((item)=>item['title']).join('/'),
      username: json['user']['username'],
      collectionCount: json['likeCount'],
      commentsCount: json['commentsCount'],
      title: json['title'],
      createTime: Util.getTimeDutation(json['createdAt']),
      detailUrl: json['originalUrl']
    );
  }
}
// import 'package:json_annotation/json_annotation.dart';
// part 'indexCell.g.dart';
// @JsonSerializable()
// class IndexCell{
//   bool hot;
//   String isCollection;
//   String tag;
//   String username;
//   int collectionCount;
//   int commentCount;
//   String title;
//   String createTime;
//   String detailUrl;
//   IndexCell({
//     this.hot,
//     this.isCollection,
//     this.tag,
//     this.username,
//     this.collectionCount,
//     this.commentCount,
//     this.title,
//     this.createTime,
//     this.detailUrl
//   });
// }
