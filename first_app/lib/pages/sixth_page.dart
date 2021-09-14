import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sixth Form'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName;
  String? _lastName;
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your firstname',
              icon: Icon(Icons.business),
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
                icon: Icon(Icons.family_restroom)),
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
                labelText: 'Enter your age',
                icon: Icon(Icons.ring_volume)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter something';
              }
              if (int.parse(value) < 18) {
                return 'Please enter valid age';
              }
              return null;
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),
          ElevatedButton(
              onPressed: (){
               
                if (_formKey.currentState!.validate()) {
                   _formKey.currentState!.save();
                var response =  'Hoorayyyy = $_firstName $_lastName $_age';
                Navigator.pop(context,response);
                  
                 
                      }
              },
              child: Text('Validate'))
        ],
      ),
    );
  }
}
