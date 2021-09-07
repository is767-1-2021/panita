
import 'package:flutter/material.dart';

class ThridPage extends StatelessWidget {
  const ThridPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ThridPage"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.cloud)),
              Tab(icon: Icon(Icons.beach_access)),
              Tab(icon: Icon(Icons.brightness_1_outlined))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Cloud'),
            ),
            Center(
              child: Text('Umbrella'),
            ),
            Center(
              child: Text('Sunny'),
            ),
          ],
        ),
      ),
    );
  }
}