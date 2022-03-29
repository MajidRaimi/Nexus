import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/datePicker.dart';
import '../widgets/textInputField.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final TextEditingController _tutorController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  final initialDate = DateTime.now();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  void dispose() {
    super.dispose();
    _tutorController.dispose();
    _aboutController.dispose();
    _linkController.dispose(); 
  }

  Future pickTime(BuildContext context) async {
    const initialTime = TimeOfDay(hour: 6, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? initialTime,
      builder: (context, child) => Theme(
        child: child!,
        data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(primary: kMainColor)),
      ),
    );
    if (newTime == null) return;
    setState(() {
      selectedTime = newTime;
    });
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? initialDate,
      firstDate: initialDate,
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) => Theme(
        child: child!,
        data: ThemeData().copyWith(
            colorScheme: const ColorScheme.light(primary: kMainColor)),
      ),
    );

    if (newDate == null) return;
    setState(() {
      selectedDate = newDate;
    });
  }

  String getDateText() {
    if (selectedDate == null) return "Select Date";
    return "${selectedDate?.day} / ${selectedDate?.month} / ${selectedDate?.year} ";
  }

  String getTimeText() {
    if (selectedTime == null) return "Select Time";
    return "${selectedTime?.hour} : ${selectedTime?.minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.95,
      color: kBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              print(selectedDate);
            },
            backgroundColor: kMainColor,
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            leading: GestureDetector(
              child:
                  const Icon(Icons.arrow_downward_outlined, color: kMainColor),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            elevation: 0,
            backgroundColor: kBackgroundColor,
            title: const Text(
              "Add Event",
              style: TextStyle(
                color: kMainColor,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFieldInput(
                  prefixIcon: const Icon(Icons.person, color: kMainColor),
                  keyboardType: TextInputType.text,
                  controller: _tutorController,
                  hintText: "Event Name",
                ),
                const SizedBox(height: 12),
                TextFieldInput(
                  prefixIcon: const Icon(Icons.info, color: kMainColor),
                  keyboardType: TextInputType.text,
                  controller: _aboutController,
                  hintText: "About What",
                ),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await pickDate(context);
                      },
                      child: Text(
                        getDateText(),
                        style: const TextStyle(
                            color: kMainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await pickTime(context);
                      },
                      child: Text(
                        getTimeText(),
                        style: const TextStyle(
                            color: kMainColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 42),
                Column(
                  children: [
                    TextFieldInput(
                      prefixIcon: const Icon(Icons.pin_drop_outlined,
                          color: kMainColor),
                      keyboardType: TextInputType.text,
                      controller: _linkController,
                      hintText: "Event Location",
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "Enter Your Link If It's Online",
                      style: TextStyle(color: kMainColor),
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () {
                        setState(() async {
                          _linkController.text = await FlutterClipboard.paste();
                        });
                      },
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 24),
                          child: Text("Paste Link",
                              style: TextStyle(
                                  color: kBackgroundColor, fontSize: 14)),
                        ),
                        decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
