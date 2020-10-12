import 'package:flutter/material.dart';

class FoodWidget extends StatelessWidget {
  @override
  FoodStateWidget build(BuildContext context) {
    return new FoodStateWidget();
  }
}

class FoodStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FoodState();
  }
}

class FoodState extends State<FoodStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Food")));
  }
}
