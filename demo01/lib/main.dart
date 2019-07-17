import 'package:flutter/material.dart';
import 'views/login/login.dart';
import 'views/pages/index_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: IndexPage(),
    );
  }  
}

