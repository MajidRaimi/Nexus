import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../resources/firestoreMethods.dart';
import '../widgets/eventsCard.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  get kMainColor => null;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("events")
          .orderBy("Date Published", descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: kMainColor),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              "No Events Found",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: kMainColor),
            ),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) => EventCard(
            snap: snapshot.data!.docs[index].data(),
          ),
        );
      },
    );
  }
}
