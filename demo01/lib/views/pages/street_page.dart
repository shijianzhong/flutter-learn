import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class StreetPage extends StatelessWidget {
  InAppWebViewController webView;
  String url ='http://192.168.111.32:5000/streetStatistics'; //url的链接

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: new InAppWebView(
        initialUrl: url,
        onWebViewCreated: (InAppWebViewController controller) {
          webView = controller;
        },
        onLoadStart: (InAppWebViewController controller, String url) {
        },
      ),
    );
  }
}



