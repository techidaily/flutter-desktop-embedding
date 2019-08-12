import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:example_flutter/pages/home/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Setting the screen auto fix
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    const double _defaultTextFieldWidth = 500;

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Image.asset('assets/images/login.png', fit: BoxFit.cover),
          ),
          Container(
            width: ScreenUtil().setWidth(_defaultTextFieldWidth),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  hintText: '请输入手机号码',
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(24)),
                  contentPadding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffdcdcdc)))),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(_defaultTextFieldWidth),
            child: TextField(
              controller: TextEditingController(),
              decoration: InputDecoration(
                  hintText: '请输入短信验证码',
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(24)),
                  contentPadding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffdcdcdc))),
                  suffixIcon: Container(
                    width: 100,
                    child: Center(
                      child: new Text(
                        '获取验证码',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: ScreenUtil().setSp(24)),
                      ),
                    ),
                  )),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(500.0)),
              child: Container(
                  width: ScreenUtil().setWidth(_defaultTextFieldWidth),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.black12])),
                  child: FlatButton(
                    onPressed: () {
                      _updateLoginState('');
                      print('');

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) {
                          return HomePage();
                        }),
                        (route) => false,
                      );
                    },
                    color: Colors.transparent,
                    child: Text(
                      '登录',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24)),
                    ),
                  )),
            ),
          ),
        ],
      )),
    );
  }

  _updateLoginState(String loginCertInfo) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('loginStatus', true);
//    sharedPreferences.setString('loginCertInfo', loginCertInfo);
    print('设置登录状态为true');
  }
}
