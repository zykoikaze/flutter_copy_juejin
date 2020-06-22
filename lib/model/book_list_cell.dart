import 'package:json_annotation/json_annotation.dart';
part 'book_list_cell.g.dart';
@JsonSerializable()
class BookListCell{
  int buyCount;
  String category;
  int contentSize;
  String createdAt;
  String desc;
  String finishedAt;
  String id;
  String img;
  bool isBuy;
  bool isDeleted;
  bool isEditor;
  bool isFinished;
  bool isHot;
  int isPublish;
  bool isShow;
  bool isTop;
  int lastSectionCount;
  List<String> navId;
  double price;
  String profile;
  int pv;
  Map<String,dynamic> readLog;
  List<String> section;
  List<String> tags;
  Map<String,dynamic> timeLimitDiscount;
  String title;
  String updatedAt;
  String url;
  String user;
  User userData;
  int viewCount;
  String wechatImg;
  String wechatImgDesc;
  String wechatSignal;
  BookListCell({
    this.buyCount,
    this.category,
    this.contentSize,
    this.createdAt,
    this.desc,
    this.finishedAt,
    this.id,
    this.img,
    this.isBuy,
    this.isDeleted,
    this.isEditor,
    this.isFinished,
    this.isHot,
    this.isPublish,
    this.isShow,
    this.isTop,
    this.lastSectionCount,
    this.navId,
    this.price,
    this.profile,
    this.pv,
    this.readLog,
    this.section,
    this.tags,
    this.timeLimitDiscount,
    this.title,
    this.updatedAt,
    this.url,
    this.user,
    this.userData,
    this.viewCount,
    this.wechatImg,
    this.wechatImgDesc,
    this.wechatSignal
  });
  factory BookListCell.fromJson(Map<String, dynamic> json) => _$BookListCellFromJson(json);
  Map<String, dynamic> toJson() => _$BookListCellToJson(this);
}
@JsonSerializable()
class User{
  String avatarHd;
  String avatarLarge;
  int bookletCount;
  String company;
  dynamic isAuthor;
  String isXiaoceAuthor;
  String jobTitle;
  dynamic level;
  dynamic mobilePhoneVerified;
  String objectId;
  String role;
  String selfDescription;
  String uid;
  String username;
  User({
    this.avatarHd,
    this.avatarLarge,
    this.bookletCount,
    this.company,
    this.isAuthor,
    this.isXiaoceAuthor,
    this.jobTitle,
    this.level,
    this.mobilePhoneVerified,
    this.objectId,
    this.role,
    this.selfDescription,
    this.uid,
    this.username
  });
  //反序列化
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$UserToJson(this);
}