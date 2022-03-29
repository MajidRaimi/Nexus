import 'package:flutter/material.dart';
import 'package:nexus/screens/workshopsScreen.dart';

import '../utils/constants.dart';
import 'eventsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          toolbarHeight: 0,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: kMainColor,
            labelColor: kBackgroundColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Workshops",
                icon: Icon(Icons.work_outline),
              ),
              Tab(
                text: "Events",
                icon: Icon(Icons.event),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const WorkshopsScreen(),
            EventsScreen(),
          ],
        ),
      ),
    );
  }
}
