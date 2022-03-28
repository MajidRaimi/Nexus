import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexus/widgets/textInputField.dart';

import '../utils/constants.dart';

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
                    const Icon(Icons.person, size: 90),
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
                margin: const EdgeInsets.symmetric(vertical: 40),
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 170,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: kMainColor),
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
