import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Firebase
class Calculator {
 // int id;
  String history;
  String createdate; 
  Calculator( this.history, this.createdate);

  factory Calculator.fromDs(
    Map<String, Object?> json,
  ) {
    return Calculator(
      //json['id'] as int,
      json['history'] as String,
      json['createdate'] as String,
  
      
    );
  }}
class AllCalculator {
  final List<Calculator> calculator;
  AllCalculator(this.calculator);

  factory AllCalculator.fromSnapshot(QuerySnapshot s) {
    List<Calculator> calculator = s.docs.map((DocumentSnapshot ds) {
      return Calculator.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllCalculator(calculator);
  }
}
// class SingleBooking {
//   final Booking booking;
//   SingleBooking(this.booking);

//   factory SingleBooking.fromJson(QuerySnapshot s) {
//     var booking = s.docs.map((DocumentSnapshot ds) {
//       return Booking.fromJson(ds.data() as Map<String, dynamic>);
//     });
//     return SingleBooking(booking.first);
//   }
// }

//State
class CalculatorModel extends ChangeNotifier {
  // int? _id;
  String? _history;
  String? _createdate;

  // int? get id=> this._id;

  // set id(int? value) {
  //   this._id = value;
  //   notifyListeners();
  // }

  get history => this._history;

  set history(value) {
    this._history = value;
    notifyListeners();
  }

  get createdate => this._createdate;

  set createdate(value) {
    this._createdate = value;
    notifyListeners();
  }

}



class HistoryList {
    // int id;
  String history;
  String createdate; 

  HistoryList( this.history, this.createdate);
  factory HistoryList.fromDs(
    Map<String, Object?> json,
  ) {
    return HistoryList(
      // json['id'] as int,
      json['history'] as String,
      json['createdate'] as String,
    );
  }
}

class AllHistoryList {
  final List<HistoryList> historys;
  AllHistoryList(this.historys);

  factory AllHistoryList.fromSnapshot(QuerySnapshot s) {
    List<HistoryList> history = s.docs.map((DocumentSnapshot ds) {
      return HistoryList.fromDs(ds.data() as Map<String, dynamic>);
    }).toList();
    return AllHistoryList(history);
  }
}