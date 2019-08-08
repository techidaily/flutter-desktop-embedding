import 'package:flutter/foundation.dart';

/// Shared Preferences for the application.
class SharedPreferences with ChangeNotifier {

  String _appTitle = 'WodaX Flutter Demo';
  get appTitle => _appTitle;

  /// change Application Title Name
  void changeAppTitle(String newTitle) {
    _appTitle = newTitle;
    notifyListeners();
  }
}