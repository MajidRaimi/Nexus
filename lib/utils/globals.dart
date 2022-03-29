import 'package:flutter/material.dart';

import '../screens/homeScreen.dart';
import '../screens/postsScreen.dart';

List<Widget> kScreens = [
  HomeScreen() , 
  Scaffold(
    backgroundColor: Colors.brown,
  ),
  PostsScreen() , 
  Scaffold(
    backgroundColor: Colors.purple,
  ),
];


