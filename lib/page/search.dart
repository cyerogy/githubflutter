import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  @override
  SearchStateWidget build(BuildContext context) {
    return new SearchStateWidget();
  }
}

class SearchStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SearchState();
  }
}

class SearchState extends State<SearchStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Search")));
  }
}
