import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:icovid/models/calculator_provider_model.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

import 'pages/calculator.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalculatorProvider(),
        ),
      ],
      child:MyApp(),),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Neumorphism',
      home: CalculatorApp(),
    );
  }
}

