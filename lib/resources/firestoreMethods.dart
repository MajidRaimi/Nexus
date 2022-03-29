import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        "Writer Uid": _auth.currentUser!.uid , 
        "Date Published" : DateTime.now() , 
      });
      result = "Success"; 
    } catch (e) {}

    return result;
  }
}
