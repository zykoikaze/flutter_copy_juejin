import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import './router_handler.dart';

class Routes{
  static String root = '/';
  static String articleDetail = '/detail';
  static String swipPage = '/swip';
  static String webPage = '/web';
  static String login = '/login';

  static void defineRoutes(Router router){
    router.notFoundHandler = Handler(
      handlerFunc:(context,params){
        return Center(child: Text('Route not found.'),);
      }
    );
    router.define(articleDetail,handler:articleDetailHandler);
    router.define(swipPage,handler:swipPageHandler);
    router.define(webPage,handler:webPageHandler);
    router.define(login,handler:loginHandler);
  }
}