
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';

// 引入项目包
import '../util/debug.dart';

class Counter with ChangeNotifier {

  /// 数据
  String _name = 'Flutter & Provider Demo';
  final Random _randomHelper = new Random();

  get name => _name;

  /// Actions
  changeName() {
    _name = _randomHelper.nextInt(4000).toString();
    notifyListeners();

    // 测试调用debugInfo 函数
    debugInfo('call changeName function: $_name');

    // 调用测试JSON
    _testJSONData();
  }

  _testJSONData() {
    debugInfo('call _testJSONData ...');

    Map<String, String> dataInfo = {
      'name': '$_name',
      'email': 'email=$_name@xxx.com'
    };

    String json = jsonEncode(dataInfo);

    Map<String, dynamic> user = jsonDecode(json);
    debugInfo('Howdy, ${user['email']}');
  }

}