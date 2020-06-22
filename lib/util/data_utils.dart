// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;

import '../api/api.dart';
import '../util/dio_utils.dart';
import '../model/index_cell.dart';
import '../model/pins_cell.dart';
import '../model/book_list_cell.dart';
import '../model/book_nav_cell.dart';
import '../model/city_list_cell.dart';
import '../model/activity_list_cell.dart';

class DataUtils{
  // static Future<String> _loadIndexListAsset() async{
  //   return await rootBundle.loadString('assets/indexListData.json');
  // }

  static Future<List<IndexCell>> getIndexListData(pageIndex) async{
    List<IndexCell> resultList = new List();
    // String jsonString = await _loadIndexListAsset();
    // final jsonResponseList = jsonDecode(jsonString)['indexListData'];
    Map<String,dynamic> _params = new Map();
    _params['operationName'] = '';
    _params['query'] = '';
    _params['extensions'] = {'query': {'id': "21207e9ddb1de777adeaca7a2fb38030"}};
    _params['variables'] = new Map();
    _params['variables']['first'] = 20;
    _params['variables']['order'] = 'POPULAR';
    _params['variables']['after'] = pageIndex;
    
    var response = await DioUtils.post(Api.RANK_LIST, _params);
    final jsonResponseList = response['data']['articleFeed']['items']['edges'];
    for(int i=0;i<jsonResponseList.length;i++){
      IndexCell cellData = new IndexCell.fromJson(jsonResponseList[i]['node']);
      resultList.add(cellData);
    }
    return resultList;
  }

  static Future<List<PinsCell>> getPinsListData(pageIndex) async{
    List<PinsCell> resultList = new List();
   
    Map<String,dynamic> _params = new Map();
    _params['operationName'] = '';
    _params['query'] = '';
    _params['extensions'] = {'query': {'id': "249431a8e4d85e459f6c29eb808e76d0"}};
    _params['variables'] = new Map();
    _params['variables']['size'] = 20;
    _params['variables']['afterPosition'] = '';
    _params['variables']['after'] = pageIndex;
    
    var response = await DioUtils.post(Api.RANK_LIST, _params);    
    final jsonResponseList = response['data']['recommendedActivityFeed']['items']['edges'];
    for(int i=0;i<jsonResponseList.length;i++){
      PinsCell cellData =PinsCell.fromJson(jsonResponseList[i]['node']['targets'][0]);
      resultList.add(cellData);
    }
    return resultList;
  }

  static Future<List<BookNavCell>> getBookNavData() async{
    List<BookNavCell> resultList= new List();
    var response = await DioUtils.get(Api.BOOK_NAV);
    final jsonResponseList = response['d'];
    jsonResponseList.forEach((item){
      BookNavCell cellData = BookNavCell.fromJson(item);
      resultList.add(cellData);
    });
    return resultList;
  }

  static Future<List<BookListCell>> getBookListData(pageIndex,alias) async{
    List<BookListCell> resultList = new List();
    Map<String,dynamic> _params = new Map();
    _params['uid'] = '';
    _params['client_id'] = '';
    _params['token'] = '';
    _params['src'] = 'web';
    _params['alias'] = alias;
    _params['pageNum'] = pageIndex;
    var response = await DioUtils.get(Api.BOOK_LIST,params: _params);
    final jsonResponseList = response['d'];
    jsonResponseList.forEach((item){
      BookListCell cellData = BookListCell.fromJson(item);
      resultList.add(cellData);
    });
    return resultList;
  }
  static Future<List<CityListCell>> getCityList() async{
    List<CityListCell> resultList = new List();
    Map<String,dynamic> _params = new Map();
    _params['uid'] = '';
    _params['client_id'] = '';
    _params['token'] = '';
    _params['src'] = 'web';
    var response = await DioUtils.get(Api.CITY_LIST,params: _params);
    final jsonResponseList = response['d'];
    jsonResponseList.forEach((item){
      CityListCell cellData = CityListCell.fromJson(item);
      resultList.add(cellData);
    });
    return resultList;
  }
  static Future<List<ActivityListCell>> getActivityList(pageIndex,cityAlias) async{
    List<ActivityListCell> resultList = new List();
    Map<String,dynamic> _params = new Map();
    _params['uid'] = '';
    _params['client_id'] = '';
    _params['token'] = '';
    _params['src'] = 'web';
    _params['orderType'] = 'startTime';
    _params['cityAlias'] = cityAlias;
    _params['pageNum'] = pageIndex;
    _params['pageSize'] = 20;
    var response = await DioUtils.get(Api.ACTIVITY_LIST,params: _params);
    final jsonResponseList = response['d'];
    jsonResponseList.forEach((item){
      ActivityListCell cellData = ActivityListCell.fromJson(item);
      resultList.add(cellData);
    });
    return resultList;
  }
}