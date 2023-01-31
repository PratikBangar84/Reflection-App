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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Reminder'),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Pushpak Dongre"),
                accountEmail: Text("pushpakdongre@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    "P",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
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
                      MaterialPageRoute(builder: (context) => SignIn()));
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Catogaries()));
                  })
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
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
                                'Good Day Today',
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
                                  '19/05/2022',
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Material(
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 200,
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
                                'Achieved 60kgs today',
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
                                  '25/12/2022',
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Material(
                            child: ClipRRect(
                              child: Container(
                                height: 100,
                                width: 200,
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
                                'Vibe High',
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
                              child: Container(
                                height: 100,
                                width: 200,
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
                        SizedBox(height: 15)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            // isExtended: true,
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyOg()));
            }));
  }
}
