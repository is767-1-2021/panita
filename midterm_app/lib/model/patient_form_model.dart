import 'package:flutter/material.dart';

class patientFormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  String? _hospital;
  String? _phone;
  DateTime? _dateappointment;
  TimeOfDay? _timeappointment;

  

  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  } 

  get lastName => this._lastName;

  set lastName(value) {
    this._lastName = value;
    notifyListeners();
  } 

  get hospital => this._hospital;

  set hospital(value) {
    this._hospital = value;
    notifyListeners();
  }

  get phone => this._phone;

  set phone(value) {
    this._phone = value;
    notifyListeners();
  }

 get dateappointment => this._dateappointment;

  set dateappointment(value) {
    this._dateappointment = value;
    notifyListeners();
  }

  get timeappointment => this._timeappointment;

  set timeappointment(value) {
    this._timeappointment = value;
    notifyListeners();
  }


   
}