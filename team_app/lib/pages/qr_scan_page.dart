import 'package:first_app/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qrscan/qrscan.dart' as scanner;
  
  class ScanQR_Page extends StatefulWidget {
    const ScanQR_Page({ Key? key }) : super(key: key);
  
    @override
    _ScanQR_PageState createState() => _ScanQR_PageState();
  }
  
  class _ScanQR_PageState extends State<ScanQR_Page> {
    String qrString = "Not Scanned";
    double? height,width;


    @override
    Widget build(BuildContext context) {
     return  Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(qrString,
              style: TextStyle(color: Colors.blue,fontSize: 30),),
              
            ],
          ),
          // SizedBox(width: width,),
          // ElevatedButton(onPressed: (){}
          // , child: Text("บันทึกการเข้ารับการตรวจ"))
SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("บันทึกผลการตรวจ"),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Result_Page();
                    }));
                  },
                ),
              ),
        ],),
        
        floatingActionButton: FloatingActionButton(
          onPressed: scanQR,
          child: Icon(Icons.qr_code_outlined),
          ),
    );
}
Future<void> scanQR() async {
  
  try {
    FlutterBarcodeScanner.scanBarcode(
    "#2A99CF", 
    "Cancle", true,ScanMode.QR);
  }
  catch(e){
    setState(() {
      
    });
  }
}

}