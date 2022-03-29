import 'package:flutter/material.dart';
import 'package:nexus/utils/constants.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

import '../utils/globals.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = PageController();

  void goToPage(int index) {
    setState(
      () {
        _controller.animateToPage(index,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinCircleBottomBarHolder(
        bottomNavigationBar: SCBottomBarDetails(
          bnbHeight: 80,
          circleColors: [
            kBackgroundColor,
            kSecondaryColor,
            kMainColor,
          ],
          iconTheme: const IconThemeData(color: kSecondaryColor, size: 28),
          activeIconTheme: const IconThemeData(color: kMainColor, size: 32),
          backgroundColor: Colors.white,
          actionButtonDetails: SCActionButtonDetails(
            color: kMainColor,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            elevation: 0,
          ),
          elevation: 0.0,
          items: [
            // Suggested count : 4
            SCBottomBarItem(
              icon: Icons.home_outlined,
              onPressed: () => goToPage(0),
            ),
            SCBottomBarItem(
              icon: Icons.search,
              onPressed: () => goToPage(1),
            ),
            SCBottomBarItem(
              icon: Icons.notifications_outlined,
              onPressed: () => goToPage(2),
            ),
            SCBottomBarItem(
              icon: Icons.person_outlined,
              onPressed: () => goToPage(3),
            ),
          ],
          circleItems: [
            //Suggested Count: 3
            SCItem(
                icon: const Icon(
                  Icons.add,
                  color: kMainColor,
                ),
                onPressed: () {}),
            SCItem(
                icon: const Icon(
                  Icons.event,
                  color: kMainColor,
                ),
                onPressed: () {}),
            SCItem(
                icon: const Icon(
                  Icons.work_outline,
                  color: kMainColor,
                ),
                onPressed: () {}),
          ],
        ),
        child: Container(
          color: kBackgroundColor,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: kScreens,
          ),
        ),
      ),
    );
  }
}
