import 'package:example_flutter/pages/login/login.dart' show LoginPage;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  List<Widget> _list = new List<Widget>();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isLogon = sharedPreferences.getBool('loginStatus');
    print('loginStatus = $isLogon');

    if (isLogon == null || !isLogon) {
      print('未检测到已登录状态');
      await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
    }
  }

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
    final sharedPreferences = Provider.of<MySharedPreferences>(context);
    final randomHelper = Provider.of<RandomHelper>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title != null ? widget.title : 'widget.title'),
      ),
      body: SafeArea(
          child: GestureDetector(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${sharedPreferences.appTitle}',
                  style: TextStyle(
                    fontSize: 22,
                    backgroundColor: Colors.black54,
                  ),
                ),
                SizedBox(
                  child: Container(
                    child: Text(
                      'You have pushed the button this many times:',
                    ),
                  ),
                ),
                FlatButton(
                  child: Text('Get ...'),
                  color: Colors.red,
                  onPressed: () => {},
                ),
              ],
            ),
            Text(
              '${randomHelper.value}',
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .merge(TextStyle(color: Color.fromARGB(139, 189, 20, 123))),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        )),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return MainScreen();
          }));
        },
      )),
      floatingActionButton: FloatingActionButton(
        // Note: The => arrow function, one express for this.
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
