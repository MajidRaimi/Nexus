import "package:flutter/material.dart";

import '../widgets/advanceAlertDialog.dart';

showAdvanceDialog(
  context, {
  String title = "Warning",
  String massage = "Some Error Occurred",
}) {
  showDialog(
    context: context,
    builder: (context) => AdvanceCustomAlert(massage: massage, title: title),
  );
}
