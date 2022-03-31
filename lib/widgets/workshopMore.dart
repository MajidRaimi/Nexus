import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/link.dart';

import '../resources/firestoreMethods.dart';
import '../utils/constants.dart';

class WorkshopMore extends StatefulWidget {
  const WorkshopMore({Key? key, required this.snap}) : super(key: key);

  final Map<String, dynamic> snap;

  @override
  State<WorkshopMore> createState() => _WorkshopMoreState();
}

class _WorkshopMoreState extends State<WorkshopMore> {
  final TextStyle textStyle = const TextStyle(
    color: kMainColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            backgroundColor: kBackgroundColor,
            body: SpinKitFadingCube(color: kMainColor),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: kBackgroundColor,
              elevation: 0,
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: kMainColor,
                ),
              ),
              title: Text(
                widget.snap["Text"],
                style: const TextStyle(
                  color: kMainColor,
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Hero(
                          tag: "1",
                          child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/workshopPNG.png")),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Title : ${widget.snap['Text']}",
                            style: textStyle,
                          ),
                          Text(
                            "About : ${widget.snap['About What']}",
                            style: textStyle,
                          ),
                          Text(
                            "In 31 - 3 - 2021 At 6:00 PM" ,
                            //"Date : ${(widget.snap['Date'] as Timestamp).toDate()} Time : ${widget.snap['Time']} ",
                            style: textStyle,
                          ),
                          Text(
                            "Tutor Name : ${widget.snap['Tutor Name']}",
                            style: textStyle,
                          ),
                          Link(
                            uri: Uri.parse("${widget.snap['Location']}"),
                            builder: (context, followLink) {
                              return GestureDetector(
                                onTap: followLink,
                                child: Text(
                                  "Open Location",
                                  style: textStyle,
                                ),
                              );
                            },
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                await FirestoreMethods().attendWorkshop(
                                    workshopUid: widget.snap['Workshop Uid'],
                                    userUid:
                                        FirebaseAuth.instance.currentUser!.uid);
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 40),
                                child: Text(
                                  "Attend",
                                  style: TextStyle(
                                      color: kBackgroundColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
