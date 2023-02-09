import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/belief.dart';
import 'package:flutter_application_5/bottomnavbar.dart';
import 'package:readmore/readmore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Center(
          child: Text(
            'Reminder',
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("posts").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            int randomN = random.nextInt(snapshot.data!.docs.length);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                    color: Colors.lightBlueAccent,
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
                              child: Text(
                                snapshot.data!.docs[randomN]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 3),
                              child: Text(
                                '24/01/2022',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                    color: Colors.grey.shade800),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Material(
                            child: ClipRRect(
                              child: Image.network(
                                  snapshot.data!.docs[randomN]['image']),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 10,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            shadowColor: Colors.grey.shade700,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 10),
                          child: ReadMoreText(
                            snapshot.data!.docs[randomN]['body'],
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.grey.shade800),
                            trimLines: 3,
                            colorClickableText: Colors.black,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            lessStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          }),
      floatingActionButton: Wrap(
        //will break to another line on overflow
        direction: Axis.horizontal, //use vertical to show  on vertical axis
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 1
                },
                child: Icon(Icons.refresh),
              )), //button first

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 2
                },
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.delete),
              )), // button second

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 3
                },
                backgroundColor: Colors.deepOrangeAccent,
                child: Icon(Icons.edit),
              )),

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 3
                },
                backgroundColor: Colors.pinkAccent,
                child: Icon(Icons.add),
              )),

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Navbar(
                                index: 0,
                              )));
                },
                backgroundColor: Colors.green,
                child: Icon(Icons.home),
              )),

          Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                onPressed: () {
                  //action code for button 2
                },
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(Icons.delete),
              )),
          // button third

          // Add more buttons here
        ],
      ),
    );
  }
}
