import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/belief.dart';
import 'package:flutter_application_5/catogaries.dart';
import 'package:flutter_application_5/login.dart';
import 'package:flutter_application_5/textscreenog.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  Random random = new Random();
  List colors = [
    0xffdee0f3,
    0xfff9e6f9,
    0xffe4c7f2,
    0xfffcfee5,
    0xfffee3d2,
    0xfff0ffda
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Reminder'),
        ),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("posts").snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  int randomN = random.nextInt(snapshot.data!.docs.length);
                  int prevRandomN = random.nextInt(snapshot.data!.docs.length);
                  int nextRandomN = random.nextInt(snapshot.data!.docs.length);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 40),
                        color: Colors.greenAccent,
                        elevation: 10,
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
                                    child: Text(
                                      snapshot.data!.docs[prevRandomN]['title'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.grey.shade800),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 3),
                                    child: Center(
                                      child: Text(
                                        '19/01/2023',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: Colors.grey.shade800),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Material(
                                  child: ClipRRect(
                                    child: Container(
                                      height: 100,
                                      width: 200,
                                      child: Image.network(
                                        snapshot.data!.docs[prevRandomN]
                                            ['image'],
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
                              SizedBox(height: 15)
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 40),
                        color: Color.fromARGB(255, 245, 101, 149),
                        elevation: 10,
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    child: Center(
                                      child: Text(
                                        '25/01/2023',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: Colors.grey.shade800),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Material(
                                  child: ClipRRect(
                                    child: Container(
                                      height: 100,
                                      width: 200,
                                      child: Image.network(
                                        snapshot.data!.docs[randomN]['image'],
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
                              SizedBox(height: 15)
                            ],
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        margin: EdgeInsets.fromLTRB(5, 5, 5, 40),
                        color: Color.fromARGB(255, 108, 158, 244),
                        elevation: 10,
                        child: SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(12, 12, 12, 2),
                                    child: Text(
                                      snapshot.data!.docs[nextRandomN]['title'],
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Material(
                                  child: ClipRRect(
                                    child: Container(
                                      height: 100,
                                      width: 200,
                                      child: Image.network(
                                        snapshot.data!.docs[nextRandomN]
                                            ['image'],
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
                              SizedBox(height: 15)
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                })),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            // isExtended: true,
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddQuote()));
            }));
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  DocumentSnapshot? data;
  getData() async {
    data = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  accountName: Text(data!['name']),
                  accountEmail: Text(data!['email']),
                  currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(35),
                        child: Text(
                          data!['name'].substring(0, 1).toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Login/Sign Up"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text("Random settings"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Belief()));
                  },
                ),
                ListTile(
                    leading: Icon(Icons.file_upload_sharp),
                    title: Text("Your Posts"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Catogaries()));
                    })
              ],
            ),
    );
  }
}
