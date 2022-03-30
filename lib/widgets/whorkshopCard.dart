import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'workshopMore.dart';

class WorkshopCard extends StatefulWidget {
  const WorkshopCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  final Map<String, dynamic> snap;

  @override
  State<WorkshopCard> createState() => _WorkshopCardState();
}

class _WorkshopCardState extends State<WorkshopCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        elevation: 12,
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.red,
                        child: const Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            "https://www.kindacode.com/wp-content/uploads/2020/10/Screen-Shot-2020-10-19-at-07.19.11.jpg",
                          ),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.snap["Text"]),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WorkshopMore(snap: widget.snap),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Text("Read More "),
                              Icon(Icons.arrow_right)
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
                )
              ],
            )),
      ),
    );
  }
}
