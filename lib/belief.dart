import 'package:flutter/material.dart';
import 'package:flutter_application_5/bottomnavbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Belief extends StatefulWidget {
  const Belief({Key? key}) : super(key: key);

  @override
  State<Belief> createState() => _BeliefState();
}

class _BeliefState extends State<Belief> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Reminder'),
        ),
      ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navbar(
                                    index: 0,
                                  )));
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
                      // setState(() {
                      //   selectedIndex = 1;
                      // });
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
                      // setState(() {
                      //   selectedIndex = 2;
                      // });
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
                      // setState(() {
                      //   selectedIndex = 3;
                      // });
                    },
                  ),
                ]),
          )),
      body: SafeArea(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              margin: EdgeInsets.fromLTRB(5, 5, 5, 50),
              color: Colors.blueAccent,
              elevation: 10,
              child: SizedBox(
                height: 393,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
                      child: Text(
                        'My old belief',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade800),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Material(
                            child: ClipRRect(
                              child: Container(
                                height: 135,
                                width: 300,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1642599241936-ed284a9b77d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            shadowColor: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Divider(
                        height: 2.0,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 5, 12, 2),
                      child: Text(
                        'My new belief',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey.shade800),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Material(
                            child: ClipRRect(
                              child: Container(
                                height: 135,
                                width: 300,
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1642599241936-ed284a9b77d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            shadowColor: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          //action coe when button is pressed
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      //action coe when button is pressed
                    },
                    icon: Icon(Icons.delete),
                  ),
                  IconButton(
                      onPressed: () {
                        //action coe when button is pressed
                      },
                      icon: Icon(Icons.refresh)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
