import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../model/index_cell.dart';
import '../util/data_utils.dart';
import '../widgets/index_list_cell.dart';
import '../widgets/index_list_header.dart';
import '../widgets/load_more.dart';

class IndexPage extends StatefulWidget{
  _IndexPageState createState()=>_IndexPageState();
}
class _IndexPageState extends State<IndexPage>{
  List<IndexCell> listData = new List();
  static const pageIndexArray = Constants.RANK_BEFORE;
  int pageIndex = 0;
  bool isRequesting = false;
  bool hasMore = true;
  getList(bool isLoadMore){
    if(isRequesting || !hasMore) return;
    if(!isLoadMore){
      pageIndex = 0;
    }
    isRequesting = true;
    DataUtils.getIndexListData(pageIndexArray[pageIndex]).then((result){
      pageIndex +=1 ;
      List<IndexCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(listData);
      }
      resultList.addAll(result);
      if(mounted){
        setState(() {
          listData = resultList;
          isRequesting = false;
          hasMore = pageIndex < pageIndexArray.length;
        });
      }
    });
  }
  // 下拉刷新
  Future<void> _onRefresh() async{
    listData.clear();
    setState(() {
      listData = listData;
      isRequesting = false;
      hasMore = true;
    });
    getList(false);
    return null;
  }
  // 渲染数据
  _renderList(context,index){
    if(index == 0){
      return IndexListHeader(false);
    }
    if(index == (listData.length + 1)){
      return LoadMore(hasMore);
    }
    return IndexListCell(cellInfo: listData[index-1],); 
  }
  // 加载更多
  ScrollController _scrollController = new ScrollController();
  
  @override
  void initState() {
    super.initState();
    getList(false);
    _scrollController.addListener((){
      if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent){
        getList(true);
      }
    });
  }  
  @override
  Widget build(BuildContext context) {
    if(listData.length == 0){
      return Center(child: CircularProgressIndicator(),);
    }
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: listData.length + 2,
        itemBuilder: (context,index)=>_renderList(context,index),
        controller: _scrollController,
      ), 
      onRefresh: _onRefresh
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }
}