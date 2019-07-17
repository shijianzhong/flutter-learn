import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  createState() => LoginState();
}

class LoginState extends State<Login> {
  var _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: Text('登录')),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              Center(
                  child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage('images/logo.png'),
                    height: 200.0,
                  ),
                  Text(
                    '机关项目',
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              )),
              Row(
                children: <Widget>[
                  Container(
                    height: 200.0,
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    // contentPadding: EdgeInsets.all(20.0),
                    hintText: '用户名',
                    icon: Icon(Icons.person)),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 20.0,
                  )
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(20.0),
                  icon: Icon(Icons.lock),
                  hintText: '密码',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool bl) {
                      if (mounted) {
                        setState(() {
                          _isChecked = bl;
                        });
                      }
                    },
                  ),
                  Text('记住密码')
                ],
              ),
              RaisedButton(
                child: Text('登录'),
                textColor: Colors.white,
                onPressed: _login,
              ),
            ],
          ),
        ));
  }

  void _login() {}
}
