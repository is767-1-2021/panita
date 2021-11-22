import 'dart:async';

import 'package:icovid/models/patient_form_model.dart';
import 'package:icovid/pages/hospital_booking_list.dart';
import 'package:icovid/services/booking_hospitel_service.dart';

class BookingHospitelController {
  final BookingHospitelServices services;
  List<BookingHospitel> bookings = List.empty();
  bool _isDisposed = false;

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  BookingHospitelController(this.services);

  // Future<List<BookingHospitel>> fecthCheckin(String hospital) async {
    Future<List<BookingHospitel>> fecthCheckin() async {
  
    if (_isDisposed) {
      onSyncController = StreamController<bool>.broadcast();
    }
    onSyncController.add(true);
    // bookings = await services.getCheckin(hospital);
    bookings = await services.getCheckin();
    onSyncController.add(false);
    dispose();
    return bookings;
  }

  void addBookingHospitel(BookingHospitelItem items) async {
    services.addBookingHospitel(items);
  }
    Future<void> updateHospitel(int idcard, String checkindate,String hospitel) async {
    await services.updateHospitel(idcard, checkindate, hospitel);
    
    }

    Future<void> updateResultPatient(int idcard, String checkindate) async {
    await services.updateResultPatient(idcard, checkindate);
    
    }
  void dispose() {
    onSyncController.close();
    _isDisposed = true;
  }
}