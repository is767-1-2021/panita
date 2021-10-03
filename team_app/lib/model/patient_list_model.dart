

import 'package:flutter/material.dart';
import 'patient_form_model.dart';

 String? firstName;
  String? lastName;
  String? hospital;
  int? id;
  String? checkin;
  String? checkout;

 class Emp_leavelist extends ChangeNotifier{
List<patientFormModel> transactions = [];

List<patientFormModel> getTransaction(){
  return transactions;
}
void addTransaction(patientFormModel statement){
  transactions.add(statement);
}

}