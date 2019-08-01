
import 'dart:math';
import 'package:flutter/foundation.dart';


class Counter with ChangeNotifier {

  /// 数据
  String _name = 'Flutter & Provider Demo';
  final Random _randomHelper = new Random();

  get name => _name;

  /// Actions
  changeName() {
    _name = _randomHelper.nextInt(4000).toString();
    notifyListeners();
  }

}