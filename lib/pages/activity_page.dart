import 'package:flutter/material.dart';
import '../util/data_utils.dart';
import '../widgets/activity_tab_view.dart';
class ActivityPage extends StatefulWidget{
  _ActivityPageState createState()=>_ActivityPageState();
}
class _ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin{
  List<Tab> tabList = new List();
  List<ActivityTabView>  tabView= new List();
  TabController _tabController;
  getCityList(){
    DataUtils.getCityList().then((result){
      List<Tab> _tabList = <Tab>[
        Tab(child: Text('全部'),),
        Tab(child: Text('北京'),),
        Tab(child: Text('上海'),),
        Tab(child: Text('广州'),),
        Tab(child: Text('深圳'),),
        Tab(child: Text('杭州'),),
      ];
      List<ActivityTabView>  _tabView= <ActivityTabView>[
        ActivityTabView(cityAlias:''),
        ActivityTabView(cityAlias:'beijing'),
        ActivityTabView(cityAlias:'shanghai'),
        ActivityTabView(cityAlias:'guangzhou'),
        ActivityTabView(cityAlias:'shenzhen'),
        ActivityTabView(cityAlias:'hangzhou'),
      ];
      result.sort((a,b){
        return a.cityAlias.toLowerCase().compareTo(b.cityAlias.toLowerCase());
      });
      result.forEach((city){
        if(city.cityName != '不限'){
          _tabList.add(Tab(child: Text(city.cityName),));
          _tabView.add(ActivityTabView(cityAlias:city.cityAlias));
        }
      });
      if(mounted){
        setState(() {
          tabList = _tabList;
          tabView = _tabView;
        });
        _tabController = new TabController(length: tabList.length, vsync: this);
      }      
    });
  }
  @override
  void initState() {
    super.initState();
    getCityList();
  }
  @override
  void dispose() {
   _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(tabList.length == 0){
      return Center(child: CircularProgressIndicator(),);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: tabList
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabView
      ),
    );
  }
}