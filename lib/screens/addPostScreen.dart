import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nexus/utils/alertDialog.dart';

import '../resources/firestoreMethods.dart';
import '../utils/constants.dart';
import '../utils/datePicker.dart';
import '../widgets/multiTextFieldLines.dart';
import '../widgets/textInputField.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _writerController = TextEditingController();
  bool _isLoading = false;
  @override
  void dispose() {
    _writerController.dispose();
    _postController.dispose();
    super.dispose();
  }

  uploadPost() async {
    setState(() {
      _isLoading = true;
    });
    String result = await FirestoreMethods()
        .uploadPost(writer: _writerController.text, text: _postController.text);

    setState(() {
      _isLoading = false;
    });

    if (result == "Success") {
      Navigator.pop(context);
    } else {
      showAdvanceDialog(context,
          title: "Ooops !", massage: "Some Error Occurred");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.95,
      color: kBackgroundColor,
      child: SafeArea(
        child: _isLoading
            ? const SpinKitFadingCube(
                color: kMainColor,
                size: 80,
              )
            : Scaffold(
                appBar: AppBar(
                  leading: GestureDetector(
                    child: const Icon(Icons.arrow_downward_outlined,
                        color: kMainColor),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  elevation: 0,
                  backgroundColor: kBackgroundColor,
                  title: const Text(
                    "Add Post",
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
                      const SizedBox(height: 42),
                      TextFieldInput(
                        hintText: "Writer",
                        controller: _writerController,
                        keyboardType: TextInputType.text,
                        prefixIcon: const Icon(Icons.person, color: kMainColor),
                      ),
                      const SizedBox(height: 42),
                      MultiTextFieldLines(controller: _postController),
                      const SizedBox(height: 68),
                      GestureDetector(
                        onTap: () async {
                          await uploadPost();
                        },
                        child: Center(
                          child: Container(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 50),
                              child: Text(
                                "Add Post",
                                style: TextStyle(
                                    color: kBackgroundColor, fontSize: 16),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
