import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AdvanceCustomAlert extends StatelessWidget {
  const AdvanceCustomAlert(
      {Key? key, required this.title, required this.massage})
      : super(key: key);
  final String title;
  final String massage;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 222,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    massage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: kMainColor,
                    child: const Text(
                      'Okay',
                      style: TextStyle(color: kBackgroundColor),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: -60,
            child: CircleAvatar(
              backgroundColor: kMainColor,
              radius: 60,
              child: Icon(
                Icons.warning_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
