
import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {

  /// 数据
  String _name = 'Flutter & Provider Demo';

  get name => _name;

  /// Actions
  ///
  ///
  changeName() {
    _name = '124';
    notifyListeners();
  }

}