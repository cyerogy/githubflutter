import 'package:flutter/material.dart';

class ShoppingWidget extends StatelessWidget {
  @override
  ShoppingStateWidget build(BuildContext context) {
    return new ShoppingStateWidget();
  }
}

class ShoppingStateWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ShoppingState();
  }
}

class ShoppingState extends State<ShoppingStateWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Shopping")));
  }
}
