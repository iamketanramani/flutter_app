import 'package:flutter/material.dart';
import 'package:flutter_app/fragment/first_fragment.dart';
import 'package:flutter_app/fragment/second_fragment.dart';

class NavigationDrawer extends StatefulWidget {
  final drawerList = [
    new DrawerModel("First Menu", Icons.android),
    new DrawerModel("Second Menu", Icons.apps),
    new DrawerModel("Third Menu", Icons.account_circle)
  ];

  @override
  State<StatefulWidget> createState() {
    return NavigationDrawerState();
  }
}

class NavigationDrawerState extends State<NavigationDrawer> {
  int selectedFragment = 0;

  updateFragment(int position) {
    switch (position) {
      case 0:
        return new FirstFragment();

      case 1:
        return new SecondFragment();

      default:
        return Center(
            child: Text(
          "No Fragment Found",
          style: TextStyle(color: Colors.red),
        ));
    }
  }

  changeFragment(int position) {
    setState(() => selectedFragment = position);
    Navigator.of(context).pop(); //Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerItems = <Widget>[];
    for (var i = 0; i < widget.drawerList.length; i++) {
      var d = widget.drawerList[i];
      drawerItems.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == selectedFragment,
        onTap: () => changeFragment(i),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drawerList[selectedFragment].title),
        //backgroundColor: Colors.redAccent,
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Ketan Ramani'),
              accountEmail: new Text('ketanramani@gmail.com'),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new ExactAssetImage('assets/nav_menu_header.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars3.githubusercontent.com/u/39004747?s=460&v=4")),
            ),
            new Column(
              children: drawerItems,
            ),
            new ListTile(
              leading: Icon(Icons.apps),
              title: new Text("Static Tab"),
              onTap: () {
                print("Static Tab Clicked");
              },
            ),
            new Divider(),
          ],
        ),
      ),
      body: updateFragment(selectedFragment),
    );
  }
}

class DrawerModel {
  String title;
  IconData icon;

  DrawerModel(this.title, this.icon);
}
