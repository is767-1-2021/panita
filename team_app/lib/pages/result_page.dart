import 'package:first_app/model/patient_form_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Result_Page extends StatefulWidget {
  const Result_Page({Key? key}) : super(key: key);

  @override
  _Result_PageState createState() => _Result_PageState();
}

class _Result_PageState extends State<Result_Page> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('บันทึกผลการตรวจ'),
      ),
      body: Card(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),

                // Consumer<FirstFormModel>(
                // builder: (context, form, child) {
                //   return Text('${form.firstName} ${form.lastName} ${form.age}');
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
                            Consumer<patientFormModel>(
                              builder: (context, form, child) {
                                return Text(
                                  '${form.firstName} ${form.lastName} ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                );
                              },
                            ),
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
                            "เบอร์โทรศัพท์ :",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(children: <Widget>[
                            
                           Consumer<patientFormModel>(
                              builder: (context, form, child) {
                                return Text(
                                  '${form.phone} ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                );
                              },
                            ),
                            
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
                           Consumer<patientFormModel>(
                              builder: (context, form, child) {
                                return Text(
                                  '${form.hospital}',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                );
                              },
                            ),
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
                           Consumer<patientFormModel>(
                              builder: (context, form, child) {
                                String dateappointment = DateFormat('dd-MM-yyyy').format(form.dateappointment);
                                return Text(
                                  '${dateappointment}',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                );
                              },
                            ),
                          ])
                        ],
                      ),
                    ]),
              )),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    ),
                    SizedBox(width: 20, height: 50),
                    ElevatedButton(
                      child: Text("ไม่ติดเชื้อ"),
                      onPressed: () {
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return approve();
                        // })
                        // );
                      },
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
