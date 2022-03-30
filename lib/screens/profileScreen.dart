import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
    required String this.uid,
  }) : super(key: key);

  final String uid;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String clubName = "";
  String clubBanner =
      "https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80";
  String clubPhoto =
      "https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80";

  getData() async {
    try {
      DocumentSnapshot snap = await FirebaseFirestore.instance
          .collection("clubs")
          .doc(widget.uid) // ! Change It
          .get();
      setState(() {
        clubName = snap['Name'];
        clubBanner = snap['Banner Url'];
        clubPhoto = snap['Photo Url'];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(clubBanner),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 48,
                    left: 5,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 42,
                          backgroundColor: kMainColor,
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: kBackgroundColor,
                          backgroundImage: NetworkImage(
                            clubPhoto,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      child: Text(
                        clubName,
                        style: TextStyle(
                            color: kMainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      bottom: 20,
                      left: 20)
                ],
              ),
            ),
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
