import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetail extends StatefulWidget{
  final String articleId;
  final String title;
  ArticleDetail(this.articleId,this.title);
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail>{
  bool hasLoaded = false;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: widget.articleId,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          print('webview创建完毕');
          _controller.complete(webViewController);
        },
        javascriptChannels: <JavascriptChannel>[
          (context){
            return JavascriptChannel(
              name: 'to', 
              onMessageReceived: (message){
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(message.message))
                );
              }
            );
          }(context)
        ].toSet(),
        onPageFinished: (url){
          print('页面加载完毕');
          setState(() {
            hasLoaded = true;
          });
        },
      ),
    );
  }
}
