import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/index_page.dart';
import 'package:dio/dio.dart';
import '../../utils/event_bus.dart';
import '../../api/request.dart';

class Login extends StatefulWidget {
  @override
  createState() => LoginState();
}

class LoginState extends State<Login> {
  var _isChecked = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return new Scaffold(
        appBar: new AppBar(title: Text('登录')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Image(
                  image: AssetImage('images/logo.png'),
                  height: ScreenUtil().setWidth(260),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    '红桥领导通',
                    style: TextStyle(fontSize: 20.0),
                  )),
              Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 40),
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: Colors.blue,
                      ),
                      hintText: '用户名',
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: passWordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.https,
                      color: Colors.blue,
                    ),
                    hintText: '密码',
                  ),
                  obscureText: true,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 35, right: 20, top: 10),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: _isChecked
                            ? Icon(
                                Icons.check_box_outline_blank,
                                size: 20.0,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.check_box,
                                size: 20.0,
                                color: Colors.blue,
                              ),
                      ),
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                    ),
                    Text(
                      '记住密码',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(650),
                padding:
                    EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 30),
                child: InkWell(
                    child: Center(
                        child: Text(
                      '登陆',
                      style: TextStyle(color: Colors.white),
                    )),
                    onTap: getHttp),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 103, 162, 255),
                      Color.fromARGB(255, 86, 138, 253)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  getHttp() async {
    try {
      var user = {
        "appType": "app",
        "platform": "ios",
        "userName": userNameController.text,
        "userPwd": passWordController.text
      };
      print(user);
      Http instance = Http.getInstance();
      Response response = await instance.post('/user/login2', user);
      print(response);
      if (response.data['code'] == 1000) {
        // Store.token = response.data['token'];
        bus.emit('login', response.data['data']['token']);

        print('登录成功');

        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new IndexPage(
                      userId: response.data['data']['userId'],
                    )));
      }
    } catch (e) {
      print(e);
    }
  }
}
