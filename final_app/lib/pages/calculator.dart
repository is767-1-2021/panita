import 'package:expressions/expressions.dart'  as EXP;
import 'package:icovid/controllers/calculator_controller.dart';
import 'package:icovid/models/calculator_model.dart';
import 'package:icovid/pages/history_page.dart';
import 'package:icovid/services/calculator_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:icovid/models/calculator_provider_model.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

const Color colorDark = Color(0xFF37474F);

CalculatorProvider _profile = CalculatorProvider();
int? _id;
String? _history;
String? _createdate;
String result = "0";

class _CalculatorAppState extends State<CalculatorApp> {
  var service = CalculatorServices();
  var controller;
  _CalculatorAppState() {
    controller = CalculatorController(service);
  }
  String equation = "0";

  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  String flag ="";

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      }
      else if (buttonText == "CE") {
         equation = "0";
        }
      
      
      else if (buttonText == "+/-") {
        if(buttonText[0] != '-'){
          equation = '-'+equation;
        }
        else {
          equation = equation.substring(1);
        }
      }

       else if (buttonText == "x\u00B2") {       
          int num = int.parse(equation);
          int sumnum = num*num;
        equation = 'sqr('+num.toString()+')';
        result = sumnum.toString();
        flag = 'x';
      }
      else if (buttonText == "\u215F\u00D7") {       
          int num = int.parse(equation);
          double sumnum = 1/num;
        equation = '1'+'/'+num.toString();
        result = sumnum.toString();
        flag = 'x';
      }

  else if (buttonText == "\u00B2\u221A\u00D7") {  
     int num1 = int.parse(equation);
     double a =sqrt(num1);
      equation = '√('+equation+')';
        result =a.toString();
     flag = 'x';
  }
 // expression = expression.replaceAll('x\u00B2', '*');
  //expression = expression.replaceAll('%', '/100');

       else if (buttonText == "=" ) {
         if(flag != 'x'){
        equationFontSize = 38.0;
        resultFontSize = 48.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');  
        expression = expression.replaceAll('+/-', '±');
               
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
         
        } catch (e) {
          result = "Error";
        }
         }

         else{
           result = result;
         }
       // context.read<CalculatorProvider>().id = 1;
        context.read<CalculatorProvider>().history = equation;
        context.read<CalculatorProvider>().createdate = DateTime.now().toString();
        
        //Add  to List
        List<HistoryList> listHistory = [];
        if (context.read<CalculatorProvider>().historyList != null) {
          listHistory = context.read<CalculatorProvider>().historyList;
        }
        

        //add to State
        listHistory.add(HistoryList( equation, DateTime.now().toString()));

        //add to firebase
        controller.addHistory(new Calculator(
          
          equation +'='+result,
          DateTime.now().toString(),
        ));

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => History()));
      } 
         else {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if (equation == "0") {
          equation = buttonText;
        } 
        
        else {
          equation = equation + buttonText;
        }
      }
   
    });
  }

  bool darkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  colorDark ,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  
                    SizedBox(height: 80),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        equation, // '6.010',
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.red),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '=',
                          style: TextStyle(
                              fontSize: 35,
                              color: darkMode ? Colors.amber : Colors.grey),
                        ),
                        Text(
                          result, //'10+500*12',
                          style: TextStyle(
                              fontSize: 20,
                              color: darkMode ? Colors.amber : Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '%', textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                      _buttonRounded(title: 'CE', textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                     _buttonRounded(title: 'C',
                          textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                      _buttonRounded(title: '⌫',
                          textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                          title: '\u215F\u00D7',
                          textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                      _buttonRounded(title: 'x\u00B2',
                          textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                      _buttonRounded(title: '\u00B2\u221A\u00D7',
                          textColor:
                              darkMode ? Colors.amber : Colors.redAccent),
                      _buttonRounded(
                          title: '÷',
                          textColor: darkMode ? Colors.amber : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                          title: 'x',
                          textColor: darkMode ? Colors.amber : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                          title: '-',
                          textColor: darkMode ? Colors.amber : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                          title: '+',
                          textColor: darkMode ? Colors.amber : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '+/-'),
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: '.'),
                      // icon: Icons.backspace_outlined,
                      // iconColor:
                      //     darkMode ? Colors.amber : Colors.redAccent),
                      _buttonRounded(
                          title: '=',
                          textColor: darkMode ? Colors.amber : Colors.redAccent)
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {String? title,
      double padding = 17,
      IconData? icon,
      Color? iconColor,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      //child: NeuContainer(
      child: ElevatedButton(
        // darkMode: darkMode,
        //borderRadius: BorderRadius.circular(40),
        // padding: EdgeInsets.all(padding),
        onPressed: () => buttonPressed(title.toString()),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                      '$title',
                      style: TextStyle(
                          color: textColor != null
                              ? textColor
                              : darkMode
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 25),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 30,
                    )),
        ),   style: ElevatedButton.styleFrom(
                          primary: colorDark,
                           padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0), ),
      ),
    ));
  }

  Widget _buttonOval({String? title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      //child: NeuContainer(
      child: ElevatedButton(
        
        // darkMode: darkMode,
        // borderRadius: BorderRadius.circular(50),
        // padding:
        //     EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        onPressed: () {},
        child: Container(
          width: padding * 2,
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      style: ElevatedButton.styleFrom(
                          primary: colorDark,
                           padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(50.0), 
                            ),
    ),));
  }


}

class NeuContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  NeuContainer(
      {this.darkMode = false,
      required this.child,
      required this.borderRadius,
      required this.padding});

  @override
  _NeuContainerState createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: colorDark ,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color:
                          darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                        color:
                            darkMode ? Colors.blueGrey.shade700 : Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ]),
        child: widget.child,
      ),
    );
  }
}
class HistoryItem {
  //final int id;
  final String history;
  final String createdate;
 

  const HistoryItem({
    Key? key,
    //required this.id,
    required this.history,
    required this.createdate,
  });

  add(Map<String, String> map) {}
}