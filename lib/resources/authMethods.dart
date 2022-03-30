import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String fullName,
      required String major,
      required String phoneNumber,
      required String email,
      required String bio,
      required String password,
      required List<String> interestsList}) async {
    String result = "Could Not Work";

    try {
      if (!(fullName.isNotEmpty &&
          major.isEmpty &&
          phoneNumber.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty)) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        await _firestore.collection("users").doc(credential.user!.uid).set({
          "User Id": credential.user!.uid,
          "Full Name": fullName,
          "Major": major,
          "Phone Number": phoneNumber,
          "Email": email,
          "Bio": bio,
          "Password": password,
          "Interests": interestsList,
          "Can Post": false,
          "Club Admin": false,
          "Club Uid" : ""
        });
        result = "Success";
      } else {
        result = "One The The Felids Is Missing";
      }
    } on FirebaseAuthException catch (err) {
      result = err.code;
    } catch (e) {
      result = e.toString();
    }

    return result;
  }

  Future<String> loginUser(String email, String password) async {
    String result = "Could Not Work";

    try {
      if (!(email.isEmpty || password.isEmpty)) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = "Logged In User Successfully";
      } else {
        result = "Please Enter All The Fields";
      }
    } catch (err) {
      result = err.toString();
    }
    return result;
  }
}
