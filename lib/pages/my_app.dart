import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:event_bus/event_bus.dart';
import './activity_page.dart';
import './book_page.dart';
import './index_page.dart';
import './pins_page.dart';
import '../widgets/login_button.dart';

import '../routers/application.dart';
import '../routers/routes.dart';

import '../event/event-bus.dart';
import '../event/event-model.dart';

class MyApp extends StatelessWidget {
  MyApp(){
    final router = Router();
    final eventBus = new EventBus();
    Routes.defineRoutes(router);
    Application.router = router;
    ApplicationEvent.event = eventBus;
  }
  
  final MaterialColor colorCustom = MaterialColor(
    0xff4D91FD,
    const <int, Color>{
      50: const Color.fromRGBO(77, 145, 253, .1),
      100: const Color.fromRGBO(77, 145, 253, .2),
      200: const Color.fromRGBO(77, 145, 253, .3),
      300: const Color.fromRGBO(77, 145, 253, .4),
      400: const Color.fromRGBO(77, 145, 253, .5),
      500: const Color.fromRGBO(77, 145, 253, .6),
      600: const Color.fromRGBO(77, 145, 253, .7),
      700: const Color.fromRGBO(77, 145, 253, .8),
      800: const Color.fromRGBO(77, 145, 253, .9),
      900: const Color.fromRGBO(77, 145, 253, 1),
    },
  );
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JueJin Flutter',
      theme: ThemeData(
        primarySwatch: colorCustom,
        backgroundColor: Color(0xfff4f5f5)
      ),
      home: MyHomePage(title: '掘金'),
      onGenerateRoute: Application.router.generator,
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  final List<Tab> _bottomTabs=<Tab>[
    Tab(
      text: '首页',
      icon: Icon(Icons.home),
    ),
    Tab(
      text: '沸点',
      icon: Icon(Icons.chat),
    ),
    Tab(
      text: '小册',
      icon: Icon(Icons.book),
    ),
    Tab(
      text: '活动',
      icon: Icon(Icons.local_activity),
    )
  ];
 TabController _tabController;
 String username = '';
 String userpic='';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _bottomTabs.length, vsync: this);
    ApplicationEvent.event.on<UserLoginInEvent>().listen((event){
      setState(() {
        username = event.username;
        userpic = event.userpic;
      });
    });
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: SvgPicture.asset('assets/logo.svg'),        
        actions: <Widget>[
          LoginButton(username: username,userpic: userpic,)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          IndexPage(),
          PinsPage(),
          BookPage(),
          ActivityPage()
        ]
      ),
      bottomNavigationBar: Material(
        color: Color(0xff4D91FD),
        child: TabBar(
          controller: _tabController,
          tabs: _bottomTabs,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}