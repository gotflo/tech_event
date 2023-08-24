import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'top_event_class.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];

  List<Event> get events => _events;

  Future<void> fetchEvents() async {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, now.day);
    DateTime endOfMonth = DateTime(now.year, now.month + 1);

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection("events")
            .where("date", isGreaterThanOrEqualTo: startOfMonth)
            .where("date", isLessThan: endOfMonth)
            // .orderBy("date")
            .get();

    _events = snapshot.docs
        .map((doc) => Event(
              doc["imageUrl"],
              doc.id,
            ))
        .toList();
    // _events = snapshot.docs.map((doc) => Event(doc["imageUrl"])).toList();
    // _eventUID = snapshot.docs.map((doc) => EventUID(doc.id)).toList();
    notifyListeners();
  }
}
