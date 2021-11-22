import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:icovid/models/patient_form_model.dart';
import 'package:icovid/pages/hospital_booking_list.dart';


abstract class BookingHospitelServices {
  Future<List<BookingHospitel>> getCheckin();
  Future<void> addBookingHospitel(BookingHospitelItem items);
  Future<void> updateHospitel(int _idcard, String _checkindate,String _hospitel);
  Future<void> updateResultPatient(int _idcard, String _checkindate);
}

class FirebaseServiceHospitel extends BookingHospitelServices {
  CollectionReference _ref = FirebaseFirestore.instance.collection('icovid_booking_hospitel');

  @override
 //Future<List<BookingHospitel>> getCheckin(String hospital) async {
   Future<List<BookingHospitel>> getCheckin() async {
   
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('icovid_booking_hospitel')
     //.where('hospital', isEqualTo: hospital)
        //.orderBy('bookingNumber', descending: false)
        .get();

    AllBookingHospitel bookings = AllBookingHospitel.fromSnapshot(snapshot);
    return bookings.bookings;
  }

  @override
  Future<void> addBookingHospitel(BookingHospitelItem items) {
    //print('items.fullName:${items.fullName}');
    return _ref.add({
      'idcard': items.idCard,
      'fullname': items.fullname,
      'phone': items.phone,
      'hospital': items.hospital,
      'checkindate': items.checkindate,
      'hospitel': items.hospitel,
      'startdateadmit': items.startdateadmit,
      'enddateadmit': items.enddateadmit,
      'status': items.status
    });
   
    //.then((value) => print('Booking Added'))
    //.catchError((error) => print("Failed to add Booking: $error"));
  }
 @override
  Future<void> updateHospitel(int _idcard, String _checkindate,String _hospitel) async {
    CollectionReference _ref = await FirebaseFirestore.instance.collection('icovid_booking_hospitel');
    FirebaseFirestore.instance
        .collection('icovid_booking_hospitel')
        .where('idcard', isEqualTo: _idcard ) 
        .where('checkindate', isEqualTo: _checkindate )
        .get()
        .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          _ref
              .doc(doc.id)
              .update({'hospitel': _hospitel});
         });
    });
  }

   @override
  Future<void> updateResultPatient(int _idcard, String _checkindate) async {
    bool isActive = true;
    CollectionReference _ref = await FirebaseFirestore.instance.collection('icovid_booking');
    FirebaseFirestore.instance
        .collection('icovid_booking')
        .where('idCardNumber', isEqualTo: _idcard.toString() ) 
        .where('checkDate', isEqualTo: _checkindate )
        .where('isActive', isEqualTo: isActive )
        .get()
        .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          _ref
              .doc(doc.id)
              .update({'result': "ติดเชื้อ"});
         });
    });
  }

}