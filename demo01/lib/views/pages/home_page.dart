import 'dart:async';
import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Container(
           child: Text('1212'),
         ),
         _webContainer(),
       ],
    );
  }

  Widget _webContainer(){
    InAppWebViewController webView;
    String url ='http://192.168.111.32:5000/homeStatistics'; //url的链接
    return Expanded(
      child:Container(
        child:  new InAppWebView(
          initialUrl: url,
          onWebViewCreated: (InAppWebViewController controller) {
            webView = controller;
          },
          onLoadStart: (InAppWebViewController controller, String url) {
          },
        ),
      ),
    ) ;
  }
}



