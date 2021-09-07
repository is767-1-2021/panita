
import 'package:flutter/material.dart';

class fifthPage extends StatelessWidget {
  const fifthPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Grid View"),),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index){
          return InkWell(
            onTap: (){
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content:Text('Tap at $index'),
              // ));
              Navigator.pushNamed(context, '/${index+1}');
              },
              child: Container(
                margin: EdgeInsets.all(20.0),
            
            decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text('Item ${index+1}',
            style: Theme.of(context).textTheme.headline5,
            )
            )));
        }),
    )
    );
  }
}