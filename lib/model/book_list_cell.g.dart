// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_cell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookListCell _$BookListCellFromJson(Map<String, dynamic> json) {
  return BookListCell(
    buyCount: json['buyCount'] as int,
    category: json['category'] as String,
    contentSize: json['contentSize'] as int,
    createdAt: json['createdAt'] as String,
    desc: json['desc'] as String,
    finishedAt: json['finishedAt'] as String,
    id: json['id'] as String,
    img: json['img'] as String,
    isBuy: json['isBuy'] as bool,
    isDeleted: json['isDeleted'] as bool,
    isEditor: json['isEditor'] as bool,
    isFinished: json['isFinished'] as bool,
    isHot: json['isHot'] as bool,
    isPublish: json['isPublish'] as int,
    isShow: json['isShow'] as bool,
    isTop: json['isTop'] as bool,
    lastSectionCount: json['lastSectionCount'] as int,
    navId: (json['navId'] as List)?.map((e) => e as String)?.toList(),
    price: (json['price'] as num)?.toDouble(),
    profile: json['profile'] as String,
    pv: json['pv'] as int,
    readLog: json['readLog'] as Map<String, dynamic>,
    section: (json['section'] as List)?.map((e) => e as String)?.toList(),
    tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
    timeLimitDiscount: json['timeLimitDiscount'] as Map<String, dynamic>,
    title: json['title'] as String,
    updatedAt: json['updatedAt'] as String,
    url: json['url'] as String,
    user: json['user'] as String,
    userData: json['userData'] == null
        ? null
        : User.fromJson(json['userData'] as Map<String, dynamic>),
    viewCount: json['viewCount'] as int,
    wechatImg: json['wechatImg'] as String,
    wechatImgDesc: json['wechatImgDesc'] as String,
    wechatSignal: json['wechatSignal'] as String,
  );
}

Map<String, dynamic> _$BookListCellToJson(BookListCell instance) =>
    <String, dynamic>{
      'buyCount': instance.buyCount,
      'category': instance.category,
      'contentSize': instance.contentSize,
      'createdAt': instance.createdAt,
      'desc': instance.desc,
      'finishedAt': instance.finishedAt,
      'id': instance.id,
      'img': instance.img,
      'isBuy': instance.isBuy,
      'isDeleted': instance.isDeleted,
      'isEditor': instance.isEditor,
      'isFinished': instance.isFinished,
      'isHot': instance.isHot,
      'isPublish': instance.isPublish,
      'isShow': instance.isShow,
      'isTop': instance.isTop,
      'lastSectionCount': instance.lastSectionCount,
      'navId': instance.navId,
      'price': instance.price,
      'profile': instance.profile,
      'pv': instance.pv,
      'readLog': instance.readLog,
      'section': instance.section,
      'tags': instance.tags,
      'timeLimitDiscount': instance.timeLimitDiscount,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
      'url': instance.url,
      'user': instance.user,
      'userData': instance.userData,
      'viewCount': instance.viewCount,
      'wechatImg': instance.wechatImg,
      'wechatImgDesc': instance.wechatImgDesc,
      'wechatSignal': instance.wechatSignal,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    avatarHd: json['avatarHd'] as String,
    avatarLarge: json['avatarLarge'] as String,
    bookletCount: json['bookletCount'] as int,
    company: json['company'] as String,
    isAuthor: json['isAuthor'],
    isXiaoceAuthor: json['isXiaoceAuthor'] as String,
    jobTitle: json['jobTitle'] as String,
    level: json['level'],
    mobilePhoneVerified: json['mobilePhoneVerified'],
    objectId: json['objectId'] as String,
    role: json['role'] as String,
    selfDescription: json['selfDescription'] as String,
    uid: json['uid'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'avatarHd': instance.avatarHd,
      'avatarLarge': instance.avatarLarge,
      'bookletCount': instance.bookletCount,
      'company': instance.company,
      'isAuthor': instance.isAuthor,
      'isXiaoceAuthor': instance.isXiaoceAuthor,
      'jobTitle': instance.jobTitle,
      'level': instance.level,
      'mobilePhoneVerified': instance.mobilePhoneVerified,
      'objectId': instance.objectId,
      'role': instance.role,
      'selfDescription': instance.selfDescription,
      'uid': instance.uid,
      'username': instance.username,
    };
