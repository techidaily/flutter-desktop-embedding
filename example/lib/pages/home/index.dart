import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/preferences.dart';
import '../../models/random.dart';

import '../screen/main-screen.dart';

/// Home Page
@immutable
class HomePage extends StatefulWidget {

  /// Construct a instance ..
  const HomePage({Key key, this.title}) : super(key: key);

  /// App Bar show title
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeAppTitle([sharedPreferences]) {
    sharedPreferences.changeAppTitle('Hi $_counter');
  }

  void _generateRandomValue([randomHelper]) {
    randomHelper.generateNext();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPreferences = Provider.of<SharedPreferences>(context);
    final randomHelper = Provider.of<RandomHelper>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                 '${sharedPreferences.appTitle} You have pushed the button this many times:',
              ),
              Text(
                '${randomHelper.value}',
                style: Theme.of(context).textTheme.display2.merge(new TextStyle(
                  color: Color.fromARGB(139, 189, 20, 123)
                )),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MainScreen();
          }));
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Note: => function, one express for this. 
        onPressed: () => {
          _incrementCounter(),
          _changeAppTitle(sharedPreferences),
          _generateRandomValue(randomHelper)
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}