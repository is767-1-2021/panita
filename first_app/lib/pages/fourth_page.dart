

import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> enties = <String>['A','B','C','D','E','F','G','H','I','J','K','L'];
    final List<int> colorCodes = <int>[600,500,100];
    return Scaffold(
appBar: AppBar(
  title: Text("Listview Example"),


),
body: ListView.separated(
  padding: EdgeInsets.all(8.0),
  itemCount: enties.length,
  itemBuilder: (context, index) {
    return Container(
      height: 100,
      color: Colors.amber[colorCodes[index % 3]],
      child: Center(
       child: Text('Entry ${enties[index]}'),),);
    
  }, 
  separatorBuilder: (context, index) => Divider(), 
    
  ), 
  
    
      
    );
  }
}