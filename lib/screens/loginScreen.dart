import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexus/utils/constants.dart';

import '../widgets/textInputField.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SafeArea(
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
                      radius: 90,
                    ),
                    SvgPicture.asset(
                      "assets/mainLogo.svg",
                      height: 120,
                    ),
                  ],
                ),
              ),
              // ! Inputs
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 48.0,
                  vertical: _height * 0.15,
                ),
                child: Column(
                  children: [
                    TextFieldInput(
                      hintText: "Enter Your Email",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon:
                          const Icon(Icons.email_outlined, color: kMainColor),
                    ),
                    TextFieldInput(
                      hintText: "Enter Your Password",
                      isPass: true,
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      prefixIcon:
                          const Icon(Icons.lock_outlined, color: kMainColor),
                    ),
                  ],
                ),
              ),
              // ! Login Button
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 170,
                    height: 50,
                    child: const Center(
                      child: Text(
                        "Login",
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
              // ! Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have An Account ? ",
                    style: TextStyle(color: kMainColor),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: kMainColor, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// TODO One : Logo Shape 
// TODO Two : Visibility Icon 
// TODO Three : On Keyboard 
// ! Make It Work