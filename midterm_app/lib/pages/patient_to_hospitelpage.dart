import 'package:midterm_app/constants/color_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/model/patient_form_model.dart';
import 'package:provider/provider.dart';


class PatienttoHospitel extends StatelessWidget {
  const PatienttoHospitel({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('ส่งตัวผู้ป่วยไปยัง Hospitel',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: iWhiteColor
          ),
        ),
        backgroundColor: iBlueColor,
      ),
      body: PatienttoHospitelCustom(),
    );
  }
}

class PatienttoHospitelCustom extends StatefulWidget {
    @override
  _PatienttoHospitelCustomState createState() => _PatienttoHospitelCustomState();
}

class _PatienttoHospitelCustomState extends State<PatienttoHospitelCustom> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
    String? _lastName;
    int? _phone;
    String? _hospitel;
  
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future<Null> selectDatePicker(BuildContext context) async{
    final DateTime? datePicked = await showDatePicker(
        context: context, 
        initialDate: date, 
        firstDate: DateTime(1940), 
        lastDate: DateTime(2030)
      );
      if(datePicked != null && datePicked != date){
        setState(() {
          date = datePicked;
        });
      }
  }

  // Future<Null> selectTimePicker(BuildContext context) async{
  //   TimeOfDay? timePicked = await showTimePicker(
  //       context: context, 
  //       initialTime: time
  //     );

  //     if(timePicked != null){
  //       setState(() {
  //         time = timePicked;
  //       });
  //     }
  // }

@override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
       child: SingleChildScrollView(
      child: Column(
         children: [
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
          ),
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your lastname',
                icon: Icon(Icons.person_pin_circle_outlined)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter something';
              }
              return null;
            },
            onSaved: (value) {
              _lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Hospitel',
                icon: Icon(Icons.local_hospital_outlined)),
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
              _hospitel = value;
            },
          ),
          ElevatedButton(
              onPressed: (){
               
                if (_formKey.currentState!.validate()) {
                   _formKey.currentState!.save();
                var response =  'คุณ $_firstName $_lastName บันทึกการส่งตัวไปที่ $_hospitel สำเร็จ';
                Navigator.pop(context,response);
                  
                 
                      }
              },
              child: Text('บันทึก'))
        ],
      ),
    ));
  }
}
      // key: _formkey,
      // child: Padding(
      //   padding: EdgeInsets.all(20.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         child: Row(
      //           children: [
      //              TextButton(
      //               child: Text('สถานที่ :',
      //                 style: TextStyle(
      //                   color: iBlackColor
      //                 ),
      //               ),
      //               onPressed: (){},
      //              // color: iBlueColor,
      //             ),
      //             Padding(
      //               padding: EdgeInsets.all(8.0),
      //               child: DropdownButton<String>(
      //                 value: dropdownValue,
      //                 //elevation: 16,
      //                 style: TextStyle(color: iBlueColor),
      //                 underline: Container(
      //                   height: 2,
      //                   color: iBlueColor,
      //                 ),
      //                 onChanged: (String? newValue) {
      //                   setState(() {
      //                     dropdownValue = newValue!;
      //                   });
      //                 },
      //                 items: <String>['โรงพยาบาลเกษมราษฏร์ประชาชื่น', 'โรงพยาบาลบำรุงราษฎร์', 'โรงพยาบาลวิภาวดี']
      //                     .map<DropdownMenuItem<String>>((String value) {
      //                   return DropdownMenuItem<String>(
      //                     value: value,
      //                     child: Text(value),
      //                   );
      //                 }).toList(),
      //               ),
      //             ),
      //           ],
      //         )
      //       ),
      //      Row(
      //        mainAxisAlignment: MainAxisAlignment.start,
      //        children: [
      //         Text(
      //               "วันที่จองคิว Hospitel :",
      //               style: TextStyle(fontSize: 15, color: Colors.black),
      //             ),
      //             Padding(
      //               padding: EdgeInsets.all(8.0),
      //               child: Text(
      //                 '${date.day}/${date.month}/${date.year}',
      //                 textAlign: TextAlign.center,  style: TextStyle(fontSize: 15, color: Colors.black),
      //               ),
      //             ),
      //             IconButton(
      //               icon: Icon(Icons.calendar_today),

      //               onPressed: () {
      //                 selectDatePicker(context);
      //               },
      //               //color: iBlueColor,
      //             ),
      //           ],
      //         ),
            
          
      //       Container(
      //         margin: EdgeInsets.only(top: 30),
      //         width: MediaQuery.of(context).size.width,
      //         height: 60,
      //         child: ElevatedButton(
      //           style: ElevatedButton.styleFrom(primary: iBlueColor),
      //           // shape: new RoundedRectangleBorder(
      //           //       borderRadius: new BorderRadius.circular(30.0),
      //           // ),
      //           // : iBlueColor,
      //           onPressed: (){
      //             showDialog(
      //               context: context, 
      //               builder: (BuildContext context){
      //                 return AlertDialog(
      //                   title: Text('ยืนยัน'),
      //                   content: Text('คุณต้องการยืนยันการจองและรับรองว่าข้อมูลดังกล่าวถูกต้องแล้ว'),
      //                   actions: [
      //                       TextButton(
      //                       onPressed: (){
      //                         Navigator.pop(context);
      //                       }, 
      //                       child: Text('ไม่ใช่')
      //                     ),
      //                     TextButton(
      //                       onPressed: (){
      //                           Navigator.push(context, 
      //                           MaterialPageRoute(builder: (context) => ScanQR_Page())
      //                         );
      //                       }, 
      //                       child: Text('ใช่')
      //                     ),
      //                   ],
      //                 );
      //               }
      //             );
      //           }, 
      //           child: Text('ถัดไป',
      //           style: TextStyle(
      //           fontSize: 20,
      //           color: iWhiteColor)),
              // ),
              // child: CupertinoAlertDialog(
              //   title: Text('ยืนยัน'),
              //   content: Text('คุณต้องการยืนยันการจองและรับรองว่าข้อมูลดังกล่าวถูกต้องแล้ว'),
              //   actions: [
              //     FlatButton(
              //       onPressed: (){
              //           Navigator.push(context, 
              //           MaterialPageRoute(builder: (context) => BookingSummaryScreen())
              //         );
              //       }, 
              //       child: Text('ใช่')
              //     ),
              //       FlatButton(
              //       onPressed: (){}, 
              //       child: Text('ไม่ใช่')
              //     ),
              //   ],
              // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }