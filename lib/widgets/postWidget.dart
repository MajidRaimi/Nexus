import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.writer, required this.text})
      : super(key: key);
  final String writer;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: Material(
        elevation: 12,
        child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: kMainColor, fontSize: 16),
                  ),
                ),
                Positioned(
                  child: Text(
                    writer,
                    style: const TextStyle(fontSize: 14, color: kMainColor),
                  ),
                  bottom: 10,
                  right: 10,
                )
              ],
            )),
      ),
    );
  }
}
