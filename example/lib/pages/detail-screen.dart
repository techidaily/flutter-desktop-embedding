import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
        ),
        onTap: () {
          // 回退到上一个路由
          Navigator.pop(context);

          // 导航到根路由
          Navigator.of(context).pushNamed('/');
        },
      ),
    );
  }
}
