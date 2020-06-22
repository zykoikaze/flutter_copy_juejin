import 'package:flutter/material.dart';
import '../model/activity_list_cell.dart';
import '../util/data_utils.dart';
import 'activity_unit.dart';
class ActivityTabView extends StatefulWidget{
  final String cityAlias;
  ActivityTabView({this.cityAlias});
  @override
  State<StatefulWidget> createState() {    
    return _ActivityTabViewState();
  }
}
class _ActivityTabViewState extends State<ActivityTabView>{
  List<ActivityListCell> activityList = new List();
  ScrollController _controller = new ScrollController();
  int pageIndex = 1;
  bool isRequesting = false;
  bool hasMore = true;

  getActivityList(bool isLoadMore){
    if(isRequesting || !hasMore) return;
    if(!isLoadMore){
      pageIndex = 1;
    }
    isRequesting = true;
    DataUtils.getActivityList(pageIndex, widget.cityAlias).then((result){
      pageIndex += 1;
      List<ActivityListCell> resultList = new List();
      if(isLoadMore){
        resultList.addAll(activityList);
      }
      resultList.addAll(result);
      if(mounted){
        setState(() {
          activityList = resultList;
          isRequesting = false;
          hasMore = result.length == 20 ? true : false;
        });
      }
    });
  }
  Future _onRefresh() async{
    activityList.clear();
    setState(() {
      pageIndex = 1;
      isRequesting = false;
      hasMore = true;
    });
    getActivityList(false);
    return null;
  }
  Widget _itemBuilder(context,index){
    return ActivityUnit(cellInfo: activityList[index],);
  }

  @override
  void initState() {
    super.initState();
    getActivityList(false);
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(activityList.length == 0){
      return Center(child: CircularProgressIndicator(),);
    }
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: activityList.length,
        itemBuilder: _itemBuilder,
        controller: _controller,
      ), 
      onRefresh: _onRefresh
    );
  }
}