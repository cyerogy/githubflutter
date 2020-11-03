import 'package:flutter/material.dart';
import './home/attractions.dart';
import './home/food.dart';
import './home/history.dart';
import './home/hotel.dart';
import './home/shopping.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new HomeStateWidget();
  }
}

class HomeStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<HomeStateWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = [
    {"value": "attractions", "label": "景点", "widget": AttractionsWidget()},
    {"value": "food", "label": "美食", "widget": FoodWidget()},
    {"value": "hotel", "label": "民宿", "widget": HotelWidget()}
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
            bottom: false,
            child: Column(children: <Widget>[
              Expanded(child: SizedBox()),
              TabBar(
                  //生成Tab菜单
                  controller: _tabController,
                  labelPadding: EdgeInsets.only(left: 30, right: 30),
                  isScrollable: true,
                  tabs: tabs.map((e) => Tab(text: e['label'])).toList())
            ])),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: e["widget"],
          );
        }).toList(),
      ),
    );
  }
}
