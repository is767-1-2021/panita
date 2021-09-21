import 'package:flutter/material.dart';

class Result_Page extends StatelessWidget {
  const Result_Page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('บันทึกผลการตรวจ'),
        ),
        body:Card(
          child:Form(
           // key: formKey,
            child:  SingleChildScrollView(
              child: Column(
                      children: [
               Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "ชื่อ-นามสกุล :",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                          //  SizedBox(
                              // height: 50,
                              // width: 250,
                             Text(
                            "น.ส.นิชา สุขใจ",
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          
                              // ),
                            )
                          ])
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "รหัสบัตรประชาชน :",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                          //  SizedBox(
                              // height: 50,
                              // width: 250,
                             Text(
                            "1234567890123",
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          
                              // ),
                            )
                          ])
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "โรงพยาบาลที่เข้ารับการตรวจ :",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                          //  SizedBox(
                              // height: 50,
                              // width: 250,
                             Text(
                            "รพ.พญาไท",
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          
                              // ),
                            )
                          ])
                        ],
                      ),
                    ]),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "วันที่เข้ารับการตรวจ :",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                          //  SizedBox(
                              // height: 50,
                              // width: 250,
                             Text(
                            "5 ต.ค.2564",
                            style: TextStyle(fontSize: 20,color: Colors.black),
                          
                              // ),
                            )
                          ])
                        ],
                      ),
                    ]),
              )),
              
              Container(
                
                child: Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton( 
                        child: Text("ติดเชื้อ"),
                        
                        onPressed: () {
                          // Navigator.pushReplacement(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return approve();
                          // })
                          // );
                        },
                      ),SizedBox(
                width: 20,
                height: 50),
                    ElevatedButton(
                    child: Text("ไม่ติดเชื้อ"),
                    onPressed: () {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return approve();
                      // })
                      // );
                    },
                  )],
                  ),
                ),
              
                      ],)
            ),
          ),
        ),);
  }
}