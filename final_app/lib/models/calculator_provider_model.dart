import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:icovid/models/calculator_model.dart';
import 'package:icovid/pages/calculator.dart';


class CalculatorProvider extends ChangeNotifier {
  int? id;
  String? history;
  String? createdate;
 
  List<HistoryList>? _calculatorList;


  get getID => this.id;

  set setID(id) {
    this.id = id;
    notifyListeners();
  }

  get getHistory => this.history;

  set setHistory(history) {
    this.history = history;
    notifyListeners();
  }

  get getCreatedate => this.createdate;

  set setCreatedate(createdate) {
    this.createdate = createdate;
    notifyListeners();
  }


  get historyList => this._calculatorList;

  set historyList(value) {
    this._calculatorList = value;
    notifyListeners();
  }


  final List<HistoryItem> _item = [];

  UnmodifiableListView<HistoryItem> get items => UnmodifiableListView(_item);

  List<HistoryItem> getHistoryList() {
    return _item;
  }

  void AddHistoryList(HistoryItem item) {
    _item.add(item);
    notifyListeners();
  }
}

