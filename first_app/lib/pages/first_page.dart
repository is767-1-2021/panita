import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.architecture)),
          IconButton(onPressed: () {}, icon: Icon(Icons.bus_alert)),
          IconButton(onPressed: () {}, icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ],
      ),
    );
  }
}