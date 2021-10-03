import 'package:flutter/material.dart';

class SecoundPage extends StatelessWidget {
  const SecoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secound Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.build_circle_sharp),
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ssss"),
            Table(
              children: [
                TableRow(children: [
                  Container(
                      child: Center(child: Text("No")),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0))),
                  Container(
                      child: Center(child: Text("Name")),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10.0))),

                  ///Text("Name"),
                ]),
                TableRow(children: [
                  Text("1"),
                  Text("A"),
                ]),
                TableRow(children: [
                  Text("2"),
                  Text("B"),
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}