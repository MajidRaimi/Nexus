import 'package:flutter/material.dart';
import 'package:nexus/utils/constants.dart';
import 'package:spincircle_bottom_bar/modals.dart';
import 'package:spincircle_bottom_bar/spincircle_bottom_bar.dart';

import '../resources/firestoreMethods.dart';
import '../utils/alertDialog.dart';
import '../utils/globals.dart';
import '../utils/showModalBottomSheet.dart';
import 'addEventScreen.dart';
import 'addPostScreen.dart';
import 'addWorkshopScreen.dart';

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

  bool isClubAdmin = false;
  canPostCheck() async {
    bool checkFirebase = await FirestoreMethods().clubAdmin();
    setState(() {
      isClubAdmin = checkFirebase;
      
    });
  }

  @override
  void initState() {
    super.initState();
    canPostCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isClubAdmin
          ? Padding(
              child: FloatingActionButton(
                onPressed: null,
                backgroundColor: kMainColor,
                child: Icon(Icons.grade_outlined),
              ),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.12),
            )
          : null,
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
                onPressed: () async {
                  if (await FirestoreMethods().canPost()) {
                    showModal(context, const AddPostScreen());
                  } else {
                    showAdvanceDialog(context,
                        title: "Can't Post",
                        massage: "Ask You'r Club Admin To Get Permission");
                  }
                }),
            SCItem(
                icon: const Icon(
                  Icons.event,
                  color: kMainColor,
                ),
                onPressed: () async {
                  if (await FirestoreMethods().canPost()) {
                    showModal(context, const AddEventScreen());
                  } else {
                    showAdvanceDialog(context,
                        title: "Can't Event",
                        massage: "Ask You'r Club Admin To Get Permission");
                  }
                }),
            SCItem(
                icon: const Icon(
                  Icons.work_outline,
                  color: kMainColor,
                ),
                onPressed: () async {
                  if (await FirestoreMethods().canPost()) {
                    showModal(context, const AddWorkshopScreen());
                  } else {
                    showAdvanceDialog(context,
                        title: "Can't Workshop",
                        massage: "Ask You'r Club Admin To Get Permission");
                  }
                }),
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
