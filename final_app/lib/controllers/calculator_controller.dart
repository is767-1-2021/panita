import 'dart:async';

import 'package:icovid/models/calculator_model.dart';
import 'package:icovid/services/calculator_service.dart';

class CalculatorController {
  final CalculatorServices services;
  List<Calculator> historys = List.empty();
  List<HistoryList> historyList = List.empty();

  StreamController<bool> onSyncController = StreamController<bool>.broadcast();
  Stream<bool> get onSync => onSyncController.stream;
  StreamController<bool> onSyncHosBookingController = StreamController<bool>.broadcast();
  Stream<bool> get onSyncHosBooking => onSyncHosBookingController.stream;
  bool _isDisposed = false;

  CalculatorController(this.services);

  Future<List<Calculator>> fecthMyHistory() async {
    if (_isDisposed) {
      onSyncController = StreamController<bool>.broadcast();
    }
    onSyncController.sink.add(true);
    historys = await services.getHistory();
    onSyncController.sink.add(false);
    dispose();
    return historys;
  }

  void addHistory(Calculator items) async {
    print('con'+items.history);
    // print('con'+items.id.toString());
      print('con'+items.createdate);
    services.addHistory(items);
  }

  Future<List<HistoryList>> fecthHistoryList() async {
    
    
    if (_isDisposed) {
      onSyncController = StreamController<bool>.broadcast();
    }
    onSyncController.add(true);
    historyList = await services.getHistoryList();
     onSyncController.add(false);
    dispose();
    return historyList;
  }


  void dispose() {
    //onSyncController.close();
    onSyncHosBookingController.close();
    _isDisposed = true;
  }
}
