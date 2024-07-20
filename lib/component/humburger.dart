
import 'package:flutter/material.dart';

class DrawerDirectory extends StatefulWidget {
  const DrawerDirectory({super.key});

  @override
  State<DrawerDirectory> createState() => _DrawerDirectoryState();
}

class _DrawerDirectoryState extends State<DrawerDirectory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Drawer Directories'),
    ),
    body: Center(
    child: InkWell(
    child: Text('Page One. Click to go to Page Two.'),
    onTap: () {

    }
    ),
    ),
      drawer: MyDrawerDirectory(),
    );
  }
}

class MyDrawerDirectory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
            Text("hello shubham"),
            Text("ok")
          ]
      ),
    );
  }
}