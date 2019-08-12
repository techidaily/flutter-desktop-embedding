import 'package:flutter/foundation.dart';

/// Shared Preferences for the application.
class MySharedPreferences with ChangeNotifier {

  String _appTitle = 'WodaX Flutter Demo';
  get appTitle => _appTitle;

  /// change Application Title Name
  void changeAppTitle(String newTitle) {
    _appTitle = newTitle;
    notifyListeners();
  }
}