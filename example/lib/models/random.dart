
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';

import '../util/debug.dart';

class RandomHelper with ChangeNotifier {

  String _value = '';
  final Random _randomHelper = new Random();

  get value => _value;

  /// Actions
  void generateNext() {
    _value = _randomHelper.nextInt(4000).toString();
    notifyListeners();

    debugInfo('call generateNext function: $_value');

    // 调用测试JSON
    _testJSONData();
  }

  _testJSONData() {
    debugInfo('call _testJSONData ...');

    Map<String, String> dataInfo = {
      'name': '$_value',
      'email': 'email=$_value@xxx.com'
    };

    String json = jsonEncode(dataInfo);

    Map<String, dynamic> user = jsonDecode(json);
    debugInfo('Howdy, ${user['email']}');
  }

}