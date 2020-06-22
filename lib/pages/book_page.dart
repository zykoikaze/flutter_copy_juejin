import 'package:flutter/material.dart';
import 'package:juejin/model/book_nav_cell.dart';
import '../util/data_utils.dart';
import '../widgets/book_tab_view.dart';
class BookPage extends StatefulWidget{
  _BookPageState createState()=>_BookPageState();
}
class _BookPageState extends State<BookPage> with SingleTickerProviderStateMixin{
  List<Tab> tabList = <Tab>[];
  List<Widget> tabView = <BookTabView>[];
  
  TabController _tabController;
  getNavList(){
    DataUtils.getBookNavData().then((result){
      List<Tab> _tabList = <Tab>[Tab(child: Text('全部'),)];
      List<Widget> _tabView = <BookTabView>[BookTabView(alias: '',)];
      result.forEach((BookNavCell tab){
        _tabList.add(Tab(
          child: Text(tab.name),
        ));
        _tabView.add(BookTabView(
          alias: tab.alias,
        ));
      });
      if(mounted){
        setState(() {
          tabList = _tabList;
          tabView = _tabView;
        });
        _tabController = TabController(length: tabList.length,vsync: this);
      }
    });
  }
  
  @override
  void initState() {
    super.initState();
    getNavList();
  }  
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color _color = Theme.of(context).primaryColor;    
    if(tabList.length == 0){
      return Center(child: CircularProgressIndicator(),);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _color,
        title: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          controller: _tabController,
          tabs: tabList,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabView
      ),
    );
  }
 
}