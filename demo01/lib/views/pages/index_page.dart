import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utils/adapt.dart';
import '../../api/request.dart';
import '../custom_buttons/button.dart';
import '../../utils/event_bus.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key, this.userId}) : super(key: key);
  dynamic userId;
  @override
  _IndexPage createState() => _IndexPage();
}

class _IndexPage extends State<IndexPage> {
  Http instance = Http.getInstance();
  List<Widget> tiles = [];
  @override
  void initState() {
    super.initState();
    _getWeather();
    _getPermissions();
  }

  _getPermissions() async {
    Response permissions =
        await instance.post('/app/getHomeFunc', {"userId": widget.userId});
    bus.emit('permissions', permissions.data['data']);
    List<Widget> tmp = [];
    var _index = '1';
    for (var item in permissions.data['data']) {
      tmp.add(new CustomButton(
        id: item['navitemId'],
        name: item['label'],
        src: 'images/btnicon' + _index + '.png',
        bgsrc: 'images/btnbg' + _index + '.png',
        width: Adapt.screenW() / 2,
        linkUrl: item['linkUrl'],
      ));
      _index = (int.parse(_index) + 1).toString();
    }
    setState(() {
      tiles = tmp;
    });
  }

  Widget buildGrid() {}
  _getWeather() async {
    Http instance = Http.getInstance();
    Response response = await instance.get(
        'http://211.157.164.162:28181/weather-server/weather/getRecentWeather',
        null);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Image(
                    image: AssetImage('images/main_top.png'),
                    width: Adapt.screenW(),
                  ),
                  Positioned(
                    bottom: -73.5 * Adapt.onepx(),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 13.0 * Adapt.onepx(),
                          right: 13.0 * Adapt.onepx()),
                      width: Adapt.screenW() - 26.0 * Adapt.onepx(),
                      height: 147.0 * Adapt.onepx(),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/weather.png'),
                              fit: BoxFit.fitWidth)),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50.0),
                width: Adapt.screenW(),
                child: Wrap(direction: Axis.horizontal, children: tiles
                    // <Widget>[
                    //   CustomButton(
                    //     id: '5',
                    //     name: '财政数据统计',
                    //     src: 'images/btnicon5.png',
                    //     bgsrc: 'images/btnbg5.png',
                    //     width: Adapt.screenW() / 2,
                    //   ),
                    //   CustomButton(
                    //     id: '1',
                    //     name: '就/失业情况统计',
                    //     src: 'images/btnicon1.png',
                    //     bgsrc: 'images/btnbg1.png',
                    //     width: Adapt.screenW() / 2,
                    //   ),
                    //   CustomButton(
                    //     id: '2',
                    //     name: '纳税情况统计',
                    //     src: 'images/btnicon2.png',
                    //     bgsrc: 'images/btnbg2.png',
                    //     width: Adapt.screenW() / 2,
                    //   ),
                    //   CustomButton(
                    //     id: '3',
                    //     name: '教育情况统计',
                    //     src: 'images/btnicon3.png',
                    //     bgsrc: 'images/btnbg3.png',
                    //     width: Adapt.screenW() / 2,
                    //   ),
                    //   CustomButton(
                    //     id: '4',
                    //     name: '重点项目统计',
                    //     src: 'images/btnicon4.png',
                    //     bgsrc: 'images/btnbg4.png',
                    //     width: Adapt.screenW() / 2,
                    //   ),
                    //   CustomButton(
                    //     id: '6',
                    //     name: '镇村简介',
                    //     src: 'images/btnicon6.png',
                    //     bgsrc: 'images/btnbg6.png',
                    //     width: Adapt.screenW() / 2,
                    //   )
                    // ],
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
