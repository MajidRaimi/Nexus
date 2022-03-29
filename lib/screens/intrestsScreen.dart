import 'package:flutter/material.dart';

import '../models/interests.dart';
import '../utils/constants.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  List<Interests> interestsList = [
    Interests(name: "Artificial Intelligence"),
    Interests(name: "Cyber\nSecurity"),
    Interests(name: "Programing"),
    Interests(name: "Gaming"),
    Interests(name: "Social Events"),
    Interests(name: "Sports"),
    Interests(name: "Technical Competitions"),
    Interests(name: "UI / UX"),
  ];

  List<String> getInterests() {
    List<String> favoritesTopics = [];

    for (int i = 0; i < interestsList.length; i++) {
      if (interestsList[i].isInterest) {
        favoritesTopics.add(interestsList[i].name);
      }
    }

    return favoritesTopics;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text(
          "Select Your Favorite Topics",
          style: TextStyle(color: kMainColor),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () async {
              return Navigator.pop(context , getInterests());
            },
            child: const Icon(
              Icons.arrow_circle_left,
              color: kMainColor,
              size: 34,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: interestsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 120,
        ),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  interestsList[i].isInterest = !interestsList[i].isInterest;
                });
              },
              child: Container(
                width: 100,
                height: 200,
                color:
                    interestsList[i].isInterest ? kMainColor : kSecondaryColor,
                child: Center(
                    child: Text(
                  interestsList[i].name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kBackgroundColor,
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
