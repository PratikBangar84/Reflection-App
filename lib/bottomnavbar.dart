import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_5/homescreen.dart';
import 'package:flutter_application_5/secondpage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int selectedIndex = 0;
  final tabs = [
    secondpage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
            child: GNav(
                backgroundColor: Colors.white,
                activeColor: Colors.black,
                gap: 5,
                tabs: [
                  GButton(
                    padding: EdgeInsets.all(8),
                    icon: Icons.alarm,
                    backgroundColor: Colors.pink.shade100,
                    iconActiveColor: Colors.pinkAccent,
                    textColor: Colors.pinkAccent,
                    text: 'Reminder          ',
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => homepage()));
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  GButton(
                    padding: EdgeInsets.all(8),
                    icon: Icons.star,
                    backgroundColor: Colors.purple.shade100,
                    iconActiveColor: Colors.purple.shade400,
                    textColor: Colors.purple.shade400,
                    text: 'Journaling       ',
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                  GButton(
                    padding: EdgeInsets.all(8),
                    icon: Icons.checklist,
                    backgroundColor: Colors.purple.shade100,
                    iconActiveColor: Colors.purple.shade400,
                    textColor: Colors.purple.shade400,
                    text: 'Checklist         ',
                    onPressed: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  GButton(
                    padding: EdgeInsets.all(8),
                    icon: Icons.person_outlined,
                    backgroundColor: Colors.pink.shade100,
                    iconActiveColor: Colors.pinkAccent,
                    textColor: Colors.pinkAccent,
                    text: 'Random Contact       ',
                    onPressed: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                ]),
          )),
      body: tabs[selectedIndex],
    );
  }
}
