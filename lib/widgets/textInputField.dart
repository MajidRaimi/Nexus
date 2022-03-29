import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:nexus/utils/constants.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.keyboardType,
      this.isPass = false,
      required this.prefixIcon,
      this.onTap,
      this.visibility = false,
      this.isOptional = false})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPass;
  final Icon prefixIcon;
  final bool showText = false;
  final Function? onTap;
  final visibility;
  final bool isOptional;

  visibilityMethod() {
    if (visibility) {
      return const Icon(Icons.visibility, color: Colors.black54);
    } else {
      return const Icon(Icons.visibility_off, color: Colors.black54);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 22,
      style: const TextStyle(color: kMainColor),
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: kMainColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: const EdgeInsets.only(top: 14.0),
        prefixIcon: prefixIcon,
        prefix: (keyboardType == TextInputType.number) ? Text("") : null,
        suffixIcon: (isPass) ? visibilityMethod() : null,
        suffix: Text(
          isOptional ? "Optional" : "*",
          style: TextStyle(color: isOptional ? kMainColor : Colors.red),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: isPass,
    );
  }
}
