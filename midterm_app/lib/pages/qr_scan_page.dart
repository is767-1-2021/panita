import 'package:midterm_app/constants/color_constant.dart';
import 'package:midterm_app/model/patient_form_model.dart';
import 'package:midterm_app/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:provider/provider.dart';

class ScanQR_Page extends StatefulWidget {
  const ScanQR_Page({Key? key}) : super(key: key);

  @override
  _ScanQR_PageState createState() => _ScanQR_PageState();
}

class _ScanQR_PageState extends State<ScanQR_Page> {
  String qrString = "Not Scanned";
  double? height, width;
  String startdate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String enddate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  DateTime? _dateappointment;

  Future<void> _openDatepickerstart(BuildContext context) async {
    final DateTime? d = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: new DateTime(2017),
        lastDate: new DateTime(2030));

    if (d != null) {
      setState(() {
        startdate = DateFormat('dd-MM-yyyy').format(d);
        _dateappointment = d;
      });
    }
  }

  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future<Null> selectDatePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030));
    if (datePicked != null && datePicked != date) {
      setState(() {
        date = datePicked;
        _dateappointment = date;
      });
    }
  }

  TimeOfDay _time = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    _time = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? _firstName;
    String? _lastName;
    String? _phone;
    String? _hospital;

    var str = "date: '2019:04:01'";
    var parts = qrString.split(' ');
    // var idcard = parts[0].trim(); // prefix: "date"
    // var qrfirstname = parts[1].trim();
    // var qrlastname = parts[2].trim();
    // var qrphone = parts[3].trim();
    // var qrhospital = parts[4].trim();
    // var qrdateappointment = parts[5].trim();
    //var date = parts.sublist(0).join('').trim();

    return Scaffold(
        appBar: AppBar(
          title: Text('?????????????????????????????????????????????',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: iWhiteColor
          ),
        ),
        backgroundColor: iBlueColor
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "????????????????????????????????????",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '${date.day}/${date.month}/${date.year}',
                      textAlign: TextAlign.center,  style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),

                    onPressed: () {
                      selectDatePicker(context);
                    },
                    //color: iBlueColor,
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your firstname',
                  icon: Icon(Icons.person_pin),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
                onSaved: (value) {
                  _firstName = value;
                },
                initialValue: context.read<patientFormModel>().firstName,

                //initialValue: prefix,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your lastname',
                  icon: Icon(Icons.person_pin_circle_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
                onSaved: (value) {
                  _lastName = value;
                },
                initialValue: context.read<patientFormModel>().lastName,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter your phone',
                    icon: Icon(Icons.ring_volume)),
                initialValue:  (context.read<patientFormModel>().phone == null) ? '': context.read<patientFormModel>().phone.toString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter something';
                  }
                  // if (int.parse(value) < 18) {
                  //   return 'Please enter valid age';
                  // }
                  return null;
                },
                onSaved: (value) {
                  _phone = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter Hospital Name',
                  icon: Icon(Icons.local_hospital_outlined),
                ),
                initialValue: context.read<patientFormModel>().hospital,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
                onSaved: (value) {
                  _hospital = value;
                },
              ),
              //Row(
              // // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // children: <Widget>[
              //   Column(
              //     children: <Widget>[
              //       Text(
              //         "?????????????????? :",
              //         style: TextStyle(fontSize: 15, color: Colors.black),

              //       ),
              //     ],
              //   ),
              //   SizedBox(
              //     width: 20,
              //     height: 50,
              //   ),
              //   Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       Row(children: <Widget>[

              //         Text(
              //           startdate,
              //           style: TextStyle(fontSize: 15, color: Colors.black),
              //         ),
              //         IconButton(
              //           icon: Icon(Icons.calendar_today),
              //           onPressed: () {
              //             _openDatepickerstart(context);

              //             // print(context);
              //             // then((date){

              //             //   setState(() {
              //             //     myleave.startdate = DateTime.parse(date);
              //             //   });

              //             // }
              //             // );
              //           },
              //         ),
              //       ])
              //     ],
              //   ),
              // ]),
              
              // Row(
              //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: <Widget>[
              //       Column(
              //         children: <Widget>[
              //           Text(
              //             "???????????? :",
              //             style: TextStyle(fontSize: 15, color: Colors.black),
              //           ),
              //         ],
              //       ),
              //       SizedBox(
              //         width: 20,
              //         height: 50,
              //       ),
              //       Column(
              //         children: <Widget>[
              //           Row(children: <Widget>[
              //             Text(
              //               '${_time.hour} : ' '${_time.minute}',
              //               style: TextStyle(fontSize: 15, color: Colors.black),
              //             ),
              //             IconButton(
              //               icon: Icon(Icons.alarm),
              //               onPressed: () {
              //                 _showTimePicker(context);
              //               },
              //             )
              //           ])
              //         ],
              //       ),
              //     ]),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       qrString,
              //       style: TextStyle(color: Colors.blue, fontSize: 30),
              //     ),

              //   ],
              // ),

              // SizedBox(width: width,),
              // ElevatedButton(onPressed: (){}
              // , child: Text("?????????????????????????????????????????????????????????????????????"))
              SizedBox(
                width: 20,
                height: 40,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    child: Text("?????????????????????????????????????????????"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // var response =  'Hoorayyyy = $_firstName $_lastName $_age';
                        //q Navigator.pop(context,response);
                        if (_dateappointment == null) {
                          _dateappointment = DateTime.now();
                        }

                        context.read<patientFormModel>().firstName = _firstName;
                        context.read<patientFormModel>().lastName = _lastName;
                        context.read<patientFormModel>().phone = _phone;
                        // context.read<patientFormModel>().timeappointment =
                        //     _time;
                        context.read<patientFormModel>().hospital = _hospital;
                        context.read<patientFormModel>().dateappointment =
                            _dateappointment;
                        // print(_dateappointment);
                        // print(_time);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Result_Page(),
                          ),
                        );
                      }
                    }),
              ),
              SizedBox(
                width: 20,
                height: 100,
              ),
              Text(qrString),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    // floatingActionButton: FloatingActionButton(
                    onPressed: scanQR,
                    child: Icon(Icons.qr_code_outlined),
                  ),
                ],
              ),
            ],
          )),
        ));
  }

  Future<void> scanQR() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#2A99CF", "Cancle", true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrString = value;
          //qrString = "panita tharaphom";
        });
      });
    } catch (e) {
      setState(() {});
    }
  }

  // _showTimePicker(BuildContext context) async {
  //   TimeOfDay? time =
  //       await showTimePicker(context: context, initialTime: _time);

  //   if (time != null)
  //     setState(() {
  //       _time = time;
  //     });
  //   else {
  //     setState(() {
  //       _time = TimeOfDay.now();
  //     });
  //   }
  // }
}
