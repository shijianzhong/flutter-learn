import 'package:flutter/material.dart';
import 'home_page.dart';
import 'staff_page.dart';
import 'event_page.dart';
import 'street_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  List<BottomNavigationBarItem> bottomTaps=[
    BottomNavigationBarItem(
        icon: Image.asset('images/home.png'),
        title: Text('首页')
    ),
    BottomNavigationBarItem(
        icon: Image.asset('images/event.png'),
        title: Text('事件')
    ),
    BottomNavigationBarItem(
        icon: Image.asset('images/staff.png'),
        title: Text('人员')
    ),
    BottomNavigationBarItem(
        icon: Image.asset('images/street.png'),
        title: Text('街道')
    ),
  ];
  List<Widget> tabBodies=[
     HomePage(),
     EventPage(),
     StaffPage(),
     StreetPage(),
  ];
  int currentIndex=0;
  var currentPage;

  @override
  void initState() {
    currentPage=tabBodies[currentIndex];
    super.initState();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Container(
            child:Row(
              children: <Widget>[
                Icon(Icons.person,color: Colors.blue),
                Text('Admin',style: TextStyle(color:Color.fromARGB(255, 55, 61, 82)),),
              ],
            ),
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.settings),
            onPressed: (){},
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          fixedColor: Colors.blue,
          items: bottomTaps,
          onTap:(index){
            setState(() {
                 currentIndex=index;
                 currentPage=tabBodies[currentIndex];
            });
          } ,
      ),
      body: currentPage,
    );
  }
}


