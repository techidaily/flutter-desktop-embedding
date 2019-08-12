// Copyright 2018 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:example_flutter/models/index.dart';
import 'package:example_flutter/models/preferences.dart';

import 'package:example_flutter/pages/home/home.dart' show HomePage;
import 'package:example_flutter/pages/screen/main-screen.dart' show MainScreen;

/// Default setting the init way for create widget
const defaultInitWay = 2;

void main() {
  // See https://github.com/flutter/flutter/wiki/Desktop-shells#target-platform-override
  // debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;

  switch (defaultInitWay) {
    case 0:
      {
        runApp(ChangeNotifierProvider(
            builder: (context) => Store(), child: MyApp()));
      }
      break;
    case 1:
      {
        runApp(MyApp());
      }
      break;
    case 2:
      {
        runApp(Store.init(context: null, child: MyApp()));
      }
      break;
    default:
  }
}

/// Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget rootWidget;
    switch (defaultInitWay) {
      case 0:
      case 1:
        {
          rootWidget = Store.init(
              context: context,
              child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  splashColor: Colors.transparent,
                  // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
                  fontFamily: 'Roboto',
                ),
                home: HomePage(title: 'Hi'),
                routes: <String, WidgetBuilder>{
                  '/main': (context) => MainScreen(),
                },
              ));
        }
        break;
      case 2:
        {
          final sharedPreferences = Provider.of<MySharedPreferences>(context);
          rootWidget = Container(
              child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              // See https://github.com/flutter/flutter/wiki/Desktop-shells#fonts
              fontFamily: 'Roboto',
            ),
            home: HomePage(title: sharedPreferences.appTitle),
            routes: <String, WidgetBuilder>{
              '/main': (context) => MainScreen(),
            },
          ));
        }
        break;
      default:
    }

    return rootWidget;
  }
}
