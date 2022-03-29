import "package:flutter/material.dart";

import '../utils/constants.dart';

class MultiTextFieldLines extends StatefulWidget {
  const MultiTextFieldLines({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;

  @override
  State<MultiTextFieldLines> createState() => _MultiTextFieldLinesState();
}

class _MultiTextFieldLinesState extends State<MultiTextFieldLines> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 6,
      maxLines: 18,
      cursorHeight: 22,
      style: const TextStyle(color: kMainColor),
      controller: widget.controller,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: "Enter Your Post",
        hintStyle: const TextStyle(
          color: kMainColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: kMainColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
      ),
    );
  }
}
