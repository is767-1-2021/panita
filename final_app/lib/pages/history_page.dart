import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icovid/constants/color_constant.dart';
import 'package:icovid/controllers/calculator_controller.dart';
import 'package:icovid/models/calculator_model.dart';
import 'package:icovid/models/calculator_provider_model.dart';
import 'package:icovid/services/calculator_service.dart';
import 'package:provider/provider.dart';
class History extends StatefulWidget {
  var service = CalculatorServices();
  
  var controller;
  var authController;
  History() {
    controller = CalculatorController(service);

  }

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
 List<HistoryList> historyList =List.empty();
  bool isLoading = false;
  CalculatorProvider _profile = CalculatorProvider();
  final auth = FirebaseAuth.instance;
 
  @override
  void initState() {
    super.initState();
    widget.controller.onSync.listen((bool syncState) => setState(() => isLoading = syncState));
   _getHistory();
  }

  void _getHistory() async {
    var historyList = await widget.controller.fecthHistoryList();
    setState(() {
        context.read<CalculatorProvider>().historyList = historyList;
    historyList = historyList;
    });
  }


  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: historyList.isEmpty ? 1 : historyList.length,
          itemBuilder: (context, index) {
            if (historyList.isEmpty) {
              return Center(
                  child: Container(
                      margin: EdgeInsets.only(top: 300),
                      child: Text('ไม่พบประวัติการคำนวณ')));
            }
            return Card(
              child: ListTile(
                onLongPress: () {
               
                },
                // leading: CircleAvatar(
                //   radius: 30,
                //   child: FittedBox(
                //     child: Text(
                //       '${historyList[index].id}',
                //       style:
                //           TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                //     ),
                //   ),
                // ),
                title: Text('${historyList[index].history}'),
               // subtitle: Text('วันที่ตรวจ ${historyList[index].createdate}'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         BookingDetail(items: _historyList[index]),
                  //   ),
                  // );
                },
              ),
            );
          });

  @override
  Widget build(BuildContext context) {
    //_getHistory();
    if (context.read<CalculatorProvider>().historyList != null) {
      historyList = context.read<CalculatorProvider>().historyList;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'History',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: iWhiteColor),
          ),
          backgroundColor: iBlueColor,
          elevation: 0.0,
        
        ),
        body: Center(
          child: body,
        ));
  }
}
