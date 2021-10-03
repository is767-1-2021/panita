import 'package:midterm_app/model/patient_form_model.dart';

import 'package:flutter/material.dart';
import 'package:midterm_app/pages/a_page.dart';
import 'package:midterm_app/pages/patient_to_hospitelpage.dart';
import 'package:provider/provider.dart';

import 'pages/b_page.dart';
import 'pages/c_page.dart';
import 'pages/d_page.dart';
import 'pages/fifth_page.dart';
import 'pages/first_page.dart';
import 'pages/fourth_page.dart';
import 'pages/login.dart';
import 'pages/patienttoHospitel_result.dart';
import 'pages/qr_scan_page.dart';
import 'pages/result_page.dart';
import 'pages/secound_page.dart';
import 'pages/sixth_page.dart';
import 'pages/thrid_page.dart';
import 'pages/seventh_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => patientFormModel(),
      ),
     
      
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demoo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.red,
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.purple))),

        //home: MyHomePage(title: 'Pop Cat'),
        initialRoute: '/7',
        routes: <String, WidgetBuilder>{
          '/1': (context) => ScanQR_Page(),
          '/2': (context) => PatienttoHospitel_Result(),//Result_Page(),
          '/3': (context) => APage(),
          '/4': (context) => BPage(),
          '/5': (context) => CPage(),
          '/6': (context) => DPage(),
          '/7': (context) => fifthPage(),
          '/8': (context) => PatienttoHospitel(),
          '/9': (context) => Result_Page(),
          '/10': (context) => LogInScreen()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );
  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 120,
  );
  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  void _incrementCounter() {
    setState(() {
      // เอาตัวแปรไปเก็บไว้ ละคืนค่าที่เก็บไว้มา หลังจาก reset แล้ว ต้องใส่เสมอเวลามีค่าเปลี่ยนแปลง
      cat = cat2;
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      cat = cat1;
      // เอาตัวแปรไปเก็บไว้ ละคืนค่าที่เก็บไว้มา หลังจาก reset แล้ว ต้องใส่เสมอเวลามีค่าเปลี่ยนแปลง
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //start , end
          children: <Widget>[
            Container(
              height: 150.0,
              margin: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(10.0)),
              child: cat,
            ),

            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            //,SubmitButton("Firstbutton"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decreaseCounter,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text('Decrease'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: _incrementCounter,
                  child: Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.access_alarm),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: () {
        print("presse");
      },
    );
  }
}
