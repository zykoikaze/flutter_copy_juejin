import 'package:fluro/fluro.dart';

import '../pages/my_app.dart';
import '../pages/article_detail.dart';
import '../pages/swip_page.dart';
import '../pages/web_page.dart';
import '../pages/login.dart';

Handler rootHandler = Handler(
  handlerFunc: (context,params){
    return MyApp();
  }
);

Handler articleDetailHandler = Handler(
  handlerFunc: (context,params){
    String articleId = params['id']?.first;
    String title = params['title']?.first;
    return ArticleDetail(articleId,title);
  }
);
Handler swipPageHandler = Handler(
  handlerFunc: (context,params){
    String pics = params['pics']?.first;
    String currentIndex = params['currentIndex']?.first;
    return SwipPage(pics: pics,currentIndex: currentIndex);
  }
);
Handler webPageHandler = Handler(
  handlerFunc: (context,params){
    String webUrl = params['url']?.first;
    String title = params['title']?.first;
    return WebPage(webUrl, title);
  }
);
Handler loginHandler = Handler(
  handlerFunc: (context,params){
    return Login();
  }
);