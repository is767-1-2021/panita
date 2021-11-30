import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icovid/models/calculator_model.dart';
import 'package:icovid/pages/calculator.dart';


abstract class ACalculator {
  Future<List<Calculator>> getHistory();
 Future<void> addHistory(Calculator items);
  Future<List<HistoryList>> getHistoryList();
 }

class CalculatorServices extends ACalculator {
  CollectionReference _ref = FirebaseFirestore.instance.collection('history');

  @override
  Future<List<Calculator>> getHistory() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('history')
        // .where('idCardNumber', isEqualTo: idCardNumber)
        // .where('isActive', isEqualTo: true)
        // .orderBy('bookingNumber', descending: false)
        .get();

    AllCalculator historys = AllCalculator.fromSnapshot(snapshot);
    return historys.calculator;
  }

  @override
  Future<void> addHistory(Calculator items) {
    return _ref.add({
      
      'history': items.history,
      'createdate':DateTime.now().toString()
    });
    //.then((value) => print('Booking Added'))
    //.catchError((error) => print("Failed to add Booking: $error"));
  }

  @override
  Future<List<HistoryList>> getHistoryList() async {
    QuerySnapshot snapshot =await FirebaseFirestore.instance.collection('history').get();
    AllHistoryList historys = AllHistoryList.fromSnapshot(snapshot);
    return historys.historys;
  }

}
