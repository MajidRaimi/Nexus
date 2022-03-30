import 'package:flutter/material.dart';

import '../screens/homeScreen.dart';
import '../screens/postsScreen.dart';
import '../screens/profileScreen.dart';
import '../screens/searchScreen.dart';

List<Widget> kScreens = [
  const HomeScreen(),
  Scaffold(),
  const PostsScreen(),
  ProfileScreen(uid: "w37MnDpE5daU86z068dM"),
];
