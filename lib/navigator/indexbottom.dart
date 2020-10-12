import 'package:flutter/material.dart';
import '../page/home.dart';
import '../page/search.dart';
import '../page/collect.dart';
import '../page/my.dart';

class IndexBottomNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexBottomNavigatorState();
}

class IndexBottomNavigatorState extends State<IndexBottomNavigator> {
  final _bottomNavigationColor = Colors.green;
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    super.initState();
    pages.add(HomeWidget());
    pages.add(SearchWidget());
    pages.add(CollectWidget());
    pages.add(MyWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '搜索',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '收藏',
                style: TextStyle(color: _bottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _bottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _bottomNavigationColor),
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
