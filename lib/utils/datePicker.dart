import "package:flutter/material.dart";

Future pickDate(BuildContext context) async {
  final initialDate = DateTime.now();
  final newDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: initialDate,
    lastDate: DateTime(DateTime.now().year + 1),
  );

  if (newDate == null) return initialDate;
  return newDate; 
}
