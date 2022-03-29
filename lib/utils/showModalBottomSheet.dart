import 'package:flutter/material.dart';

void showModal(BuildContext context, Widget widget) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: widget,
      ),
    ),
  );
}
