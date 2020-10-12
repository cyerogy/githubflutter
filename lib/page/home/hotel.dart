import 'package:flutter/material.dart';

class HotelWidget extends StatelessWidget {
  @override
  HotelStateWidget build(BuildContext context) {
    return new HotelStateWidget();
  }
}

class HotelStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HotelState();
  }
}

class HotelState extends State<HotelStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Hotel")));
  }
}
