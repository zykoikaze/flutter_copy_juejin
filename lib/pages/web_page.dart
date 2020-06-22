import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget{
  final String webUrl;
  final String title;
  WebPage(this.webUrl,this.title);
  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage>{
  bool hasLoaded = false;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebView(
        initialUrl: widget.webUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          print('webview创建完毕');
          _controller.complete(webViewController);
        },
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
