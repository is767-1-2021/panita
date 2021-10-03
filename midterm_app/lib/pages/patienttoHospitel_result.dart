import 'package:flutter/material.dart';
import 'package:midterm_app/constants/color_constant.dart';
import 'package:midterm_app/pages/fifth_page.dart';

class PatienttoHospitel_Result extends StatefulWidget {
  const PatienttoHospitel_Result({ Key? key }) : super(key: key);

  @override
  _patienttoHospitel_resultState createState() => _patienttoHospitel_resultState();
}

class _patienttoHospitel_resultState extends State<PatienttoHospitel_Result> {
  String? _formData = 'กรุณากรอกข้อมูลการส่งตัวไปยัง Hospitel';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การส่งตัวผู้ป่วยไปยัง Hospitel',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: iWhiteColor
          ),
        ),
        backgroundColor: iBlueColor),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
        //   IconButton(onPressed: () {}, icon: Icon(Icons.architecture)),
        //   IconButton(onPressed: () {
        //     Navigator.push(context,
        //     MaterialPageRoute(
        //       builder: (context) => SecoundPage(),
        //     ),
        //     );
        //     },
        //   icon: Icon(Icons.bus_alert)),
        //   IconButton(onPressed: () {
        //      Navigator.pushNamed(context, '/3');
           
        //   }, icon: Icon(Icons.medication)),
        //   IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        // ],
      
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20.0),
            child: Text('$_formData')),
            ElevatedButton(
              onPressed: () async{
              var response =  await Navigator.pushNamed(context, '/8');
              if(response != null && !response.toString().isEmpty)
              {
               
                setState(() { //เพื่อให้ค่า reset
                
                   _formData = response.toString();
                });
              }
              //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.toString()),));
             
            },
            child: Text('บันทึกการส่งตัวไปยัง Hospitel')),
            ElevatedButton(
              onPressed: () {
               Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => fifthPage(),
                          ),
                        );
            },
            child: Text('กลับสู่เมนูหลัก'))
          ],
        )),
    );
  }
}