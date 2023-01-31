import 'package:flutter/material.dart';
import 'package:flutter_application_5/belief.dart';
import 'package:flutter_application_5/bottomnavbar.dart';
import 'package:readmore/readmore.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
            color: Colors.lightBlueAccent,
            elevation: 10,
            child: SizedBox(
              height: 530,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
                        child: Text(
                          'Life Lesson',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey.shade800),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 3),
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Material(
                      child: ClipRRect(
                        child: Image.network(
                            'https://images.unsplash.com/photo-1642599241936-ed284a9b77d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
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
                      'Live Life to the fullest with greater intensity',
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
          ),
        ],
      ),
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
