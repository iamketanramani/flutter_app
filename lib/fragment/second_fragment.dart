import 'package:flutter/material.dart';
import 'package:flutter_app/tabs/first_tab.dart';
import 'package:flutter_app/tabs/second_tab.dart';
import 'package:flutter_app/tabs/third_tab.dart';

class SecondFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondFragmentState();
  }
}

class SecondFragmentState extends State<SecondFragment>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: TabBarView(
        children: <Widget>[FirstTab(), SecondTab(), ThirdTab()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.deepPurple,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.access_time),
              text: "First Tab",
            ),
            Tab(
              icon: Icon(Icons.add_alarm),
              text: "Second Tab",
            ),
            Tab(
              icon: Icon(Icons.add_comment),
              text: "Third Tab",
            )
          ],
          controller: controller,
        ),
      ),
    );
  }
}
