import 'package:flutter/material.dart';
import 'package:githubflutter/commonlib/api_list.dart';
import 'package:githubflutter/commonlib/common_api.dart';

class AttractionsWidget extends StatelessWidget {
  @override
  AttractionsStateWidget build(BuildContext context) {
    return new AttractionsStateWidget();
  }
}

class AttractionsStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AttractionsState();
  }
}

class AttractionsState extends State<AttractionsStateWidget> {
  //数据接口
  final ApiList selfapi = ApiList();
  //保存接口数据
  List list = List();
  //定义ListView的监听 ScollController ScollController能够添加对listview的滑动监听
  ScrollController _scrollController = new ScrollController();
  //当前页
  int currentPage = 1;
  //每页显示多少条
  int pageRow = 15;
  //是否显示底部加载中提示
  bool showMore = false;
  //数据是否刷新中
  bool isrefresh = true;
  @override
  void initState() {
    super.initState();
    _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        currentPage++;
        setState(() {
          showMore = true;
        });
        //加载下一页数据
        _getMoreData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    //手动停止滑动监听
    _scrollController.dispose();
  }

  Future _getMoreData() async {
    var result = await selfapi.getCityAttractions(130900, currentPage, pageRow);
    setState(() {
      isrefresh = false;
      showMore = false;
      list.addAll(result);
    });
  }

  Widget _buildRow(list, index) {
    if (isrefresh) {
      return Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '数据刷新中...',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      );
    } else {
      if (index < list.length) {
        return GestureDetector(
          onTap: () {
            print('ROUTE');
          },
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 10),
                child: Image(
                    image: NetworkImage(
                        CommonApi.BASEURL + list[index]["imageUrl"])),
              ),
              new Expanded(
                  flex: 1,
                  child: Column(children: [
                    Container(
                      height: 30.0,
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Row(children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              list[index]["name"],
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                          ),
                        ),
                        Text(
                          list[index]["star"].toString(),
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Icon(Icons.star_border, size: 24)
                      ]),
                    ),
                    Container(
                      height: 80.0,
                      padding: EdgeInsets.only(left: 5, right: 10.0),
                      child: Text(list[index]["description"],
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.0)),
                    ),
                    Container(
                      height: 30.0,
                      child: Row(children: [
                        Text(
                          list[index]["love"].toString(),
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 24.0,
                        ),
                      ]),
                    ),
                  ]))
            ],
          ),
        );
      } else if (showMore) {
        return Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );
      } else {
        return Container(
          height: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '没有更多数据了',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        );
      }
    }
  }

  Future _refreshData() async {
    setState(() {
      isrefresh = true;
      currentPage = 1;
      list.clear();
    });
    await _getMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.separated(
            controller: _scrollController,
            itemCount: list.length + 1,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return _buildRow(list, index);
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.blue);
            }),
      ),
    );
  }
}
