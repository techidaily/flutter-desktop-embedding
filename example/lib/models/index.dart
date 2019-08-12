import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'preferences.dart';
import 'random.dart';

/// Global Store
class Store with ChangeNotifier {
  /// init
  static Widget init({BuildContext context, Widget child}) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(builder: (_) => RandomHelper()),
      ChangeNotifierProvider(builder: (_) => SharedPreferences()),
    ], child: child);
  }

  /// value
  static T value<T>(BuildContext context) {
    return Provider.of(context);
  }

  /// Consumer
  static Consumer connect<T>({Function builder, Widget child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
