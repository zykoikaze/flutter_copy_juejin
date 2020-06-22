import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../model/pins_cell.dart';
import '../util/data_utils.dart';
import '../widgets/pins_list_cell.dart';
import '../widgets/load_more.dart';

class PinsPage extends StatefulWidget{
  _PinsPageState createState()=>_PinsPageState();
}
class _PinsPageState extends State<PinsPage>{
  List<PinsCell> listData = new List();
  final pageIndexArray = Constants.PINS_PAGES;
  int pageIndex = 0;
  bool isRequesting = false;
  bool hasMore=true;
  // 获取数据
  getList(bool isLoadMore){
    if(isRequesting || !hasMore) return;
    if(!isLoadMore){
      pageIndex = 0;
    }
    isRequesting = true;
    DataUtils.getPinsListData(pageIndexArray[pageIndex]).then((result){
      pageIndex += 1;
      List<PinsCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(listData);
      }
      resultList.addAll(result);
      if(mounted){
        setState(() {
          listData = result;
          isRequesting = false;
          hasMore = pageIndex < pageIndexArray.length;
        });
      }
    });
  }
  // 渲染数据
  _renderList(BuildContext context,int index){
    if(index == listData.length){
      return LoadMore(hasMore);
    }
    return PinsListCell(cellInfo: listData[index]);
  }
  // 下拉刷新 必须是异步
  Future<void> _onRefresh() async {
    listData.clear();
    setState(() {
      pageIndex = 0;
      isRequesting = false;
      hasMore = true;
    });
    getList(false);
    return null;
  }
  
  // 加载更多
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    getList(false);
    // 加载更多
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
        itemCount: listData.length + 1, //增加加载更多
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