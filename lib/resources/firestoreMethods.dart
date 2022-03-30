import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  


  Future<String> uploadPost(
      {required String writer, required String text}) async {
    String result = "Some Error Occurred";

    try {
      String postUid = const Uuid().v1();

      await _firestore.collection("posts").doc(postUid).set({
        "Post Uid": postUid,
        "Text": text,
        "Writer Name": writer,
        "Writer Uid": _auth.currentUser!.uid,
        "Date Published": DateTime.now(),
      });
      result = "Success";
    } catch (e) {}

    return result;
  }

  Future<String> uploadWorkshop({
    required String tutor,
    required String title,
    required String aboutWhat,
    required String location,
    required DateTime date,
    required String time,
  }) async {
    String result = "Some Error Occurred";

    try {
      String workshopUid = const Uuid().v1();

      await _firestore.collection("workshops").doc(workshopUid).set({
        "Workshop Uid": workshopUid,
        "Text": title,
        "About What": aboutWhat,
        "Location": location,
        "Date": date,
        "Time": time,
        "Tutor Name": tutor,
        "Uploader Uid": _auth.currentUser!.uid,
        "Date Published": DateTime.now(),
        "Attendance": []
      });
      result = "Success";
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<void> attendWorkshop({
    required String workshopUid,
    required String userUid,
  }) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection("workshops").doc(workshopUid).get();

      List attendance = (snap.data()! as dynamic)['Attendance'];

      if (attendance.contains(userUid)) {
        await _firestore.collection("workshops").doc(workshopUid).update({
          "Attendance": FieldValue.arrayRemove([userUid])
        });
      } else {
        await _firestore.collection("workshops").doc(workshopUid).update({
          "Attendance": FieldValue.arrayUnion([userUid])
        });
      }
    } catch (e) {}
  }

  Future<String> uploadEvent({
    required String name,
    required String aboutWhat,
    required String location,
    required String time,
    required DateTime date,
  }) async {
    String result = "Some Error Occurred";

    try {
      String eventUid = const Uuid().v1();

      await _firestore.collection("events").doc(eventUid).set({
        "Event Uid": eventUid,
        "Event Name": name,
        "About What": aboutWhat,
        "Location": location,
        "Date": date,
        "Time": time,
        "Uploader Uid": _auth.currentUser!.uid,
        "Date Published": DateTime.now(),
        "Attendance": []
      });
      result = "Success";
    } catch (e) {
      print(e.toString());
    }

    return result;
  }

  Future<bool> canPost() async {
    dynamic isAdmin = false;

    try {
      // ignore: unrelated_type_equality_checks
      await _firestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .get()
          .then(
        (value) {
          isAdmin = value["Club Admin"];
        },
      );
    } catch (e) {
      return false;
    }

    return isAdmin;
  }
}
