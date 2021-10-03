import 'package:flutter/material.dart';

class fifthPage extends StatelessWidget {
  final List<String> name = <String>[
    'บันทึกการตรวจ Covid',
    'บันทึกการส่งตัวไป Hospitel',
    'Menu A',
    'Menu B',
    'Menu C',
    'Menu D',
    
  ];
  final List<IconData> icon = <IconData>[
    Icons.local_hospital,Icons.local_hotel,Icons.wheelchair_pickup,Icons.brunch_dining,Icons.storefront_sharp,Icons.whatshot
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
                onTap: () {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content:Text('Tap at $index'),
                  // ));
                  Navigator.pushNamed(context, '/${index + 1}');
                },
                child: Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      // Replace with a Row for horizontal icon + text
                      children: <Widget>[
                        Icon(icon[index]),
                        Text(
                          name[index],
                          textAlign: TextAlign.center, //'Item ${index + 1}',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )
                      ],
                    ))));
          }),
        ));
  }
}
