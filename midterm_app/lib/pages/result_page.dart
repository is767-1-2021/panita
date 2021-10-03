import 'package:midterm_app/constants/color_constant.dart';
import 'package:midterm_app/model/patient_form_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'patient_list_page.dart';
import 'patient_to_hospitelpage.dart';
import 'patienttoHospitel_result.dart';
import 'qr_scan_page.dart';

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
        title: Text('บันทึกผลการตรวจ',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: iWhiteColor
          ),
        ),
        backgroundColor: iBlueColor
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "ชื่อ-นามสกุล : ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)
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
                                      fontSize: 18, color: Colors.black),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "เบอร์โทรศัพท์ : ",
                            
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)
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
                                      fontSize: 18, color: Colors.black),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "โรงพยาบาลที่เข้ารับการตรวจ : ",
                            
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)
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
                                      fontSize: 18, color: Colors.black),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "วันที่เข้ารับการตรวจ : ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black)
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
                                      fontSize: 18, color: Colors.black),
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PatienttoHospitel_Result();
                        })
                        );
                       }
                      ,
                    ),
                    SizedBox(width: 20, height: 50),
                    ElevatedButton(
                      child: Text("ไม่ติดเชื้อ"),
                      onPressed: () {
                        Navigator.pop(context);
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
