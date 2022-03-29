import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexus/widgets/textInputField.dart';

import '../resources/authMethods.dart';
import '../utils/alertDialog.dart';
import '../utils/constants.dart';
import 'intrestsScreen.dart';
import 'mainScreen.dart';
import 'onBoardingScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<String> userInterests = [];
  bool _isLoading = false;

  signUp() async {
    setState(() {
      _isLoading = true;
    });
    String result = await AuthMethods().signUpUser(
      fullName: _fullNameController.text,
      major: _majorController.text,
      phoneNumber: _phoneNumberController.text,
      email: _emailController.text,
      bio: _bioController.text,
      password: _passwordController.text,
      interestsList: userInterests,
    );
    setState(() {
      _isLoading = false;
    });

    if (result == "Success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        ),
      );
    } else {
      showAdvanceDialog(context, title: "Error", massage: result);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _majorController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // ! Logo
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: kMainColor,
                      radius: 70,
                    ),
                    const Icon(
                      Icons.person,
                      size: 90,
                      color: kBackgroundColor,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        child: Stack(
                          alignment: Alignment.center,
                          children: const [
                            CircleAvatar(
                              backgroundColor: kMainColor,
                              radius: 20,
                            ),
                            CircleAvatar(
                              backgroundColor: kBackgroundColor,
                              radius: 18,
                            ),
                            Icon(
                              Icons.add,
                              color: kMainColor,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.symmetric(vertical: 26),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldInput(
                      hintText: "Enter Your Full Name",
                      controller: _fullNameController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person, color: kMainColor),
                    ),
                    TextFieldInput(
                      hintText: "Enter Your Major",
                      controller: _majorController,
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(Icons.library_books_outlined,
                          color: kMainColor),
                    ),
                    TextFieldInput(
                      hintText: "Enter Your Phone Number",
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.number,
                      prefixIcon: const Icon(Icons.phone, color: kMainColor),
                    ),
                    TextFieldInput(
                      hintText: "Enter Your Email",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email, color: kMainColor),
                    ),
                    TextFieldInput(
                      hintText: "About Yourself",
                      controller: _bioController,
                      keyboardType: TextInputType.text,
                      isOptional: true,
                      prefixIcon: const Icon(Icons.interests_outlined,
                          color: kMainColor),
                    ),
                    TextFieldInput(
                      hintText: "Enter Your Password",
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      isPass: true,
                      prefixIcon:
                          const Icon(Icons.lock_outlined, color: kMainColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  userInterests = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InterestsScreen(),
                    ),
                  ) as List<String>;
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Select Your Interests",
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () async {
                    await signUp();
                  },
                  child: Container(
                    width: 170,
                    height: 50,
                    child: Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: kBackgroundColor,
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: kBackgroundColor,
                              ),
                            ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kMainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
