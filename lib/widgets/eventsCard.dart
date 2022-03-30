import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard({Key? key, required this.snap}) : super(key: key);
  final Map<String, dynamic> snap;
  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
            children: [
              Text("Event Name : ${widget.snap["Event Name"]}")
            ],
          ),
        ),
      ),
    );
  }
}
