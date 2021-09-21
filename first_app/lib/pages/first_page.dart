import 'package:first_app/models/first_form_model.dart';
import 'package:first_app/pages/secound_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _formData = 'Please click to fill form';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
          IconButton(onPressed: () {}, icon: Icon(Icons.architecture)),
          IconButton(onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => SecoundPage(),
            ),
            );
            },
          icon: Icon(Icons.bus_alert)),
          IconButton(onPressed: () {
             Navigator.pushNamed(context, '/3');
           
          }, icon: Icon(Icons.medication)),
          IconButton(onPressed: () {}, icon: Icon(Icons.food_bank)),
        ],
      ),
       body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Consumer<FirstFormModel>(
                builder: (context, form, child) {
                  return Text('${form.firstName} ${form.lastName} ${form.age}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/6');
              },
              child: Text('Fill this form please'),
            ),
          ],
        ),
      ),
    );
  }
}