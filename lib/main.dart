import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nexus/screens/intrestsScreen.dart';
import 'package:nexus/screens/mainScreen.dart';
import 'package:nexus/screens/onBoardingScreen.dart';
import 'package:nexus/screens/signUpScreen.dart';
import '/screens/loginScreen.dart';
import '/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexus',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kMainColor,
        accentColor: kMainColor,
        splashColor: kMainColor,
        platform: TargetPlatform.iOS,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const MainScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: kMainColor,
              ),
            );
          }
          return LoginScreen();
        },
      ),
    );
  }
}
