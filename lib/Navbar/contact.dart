import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_contacts/flutter_contacts.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  List<Contact>? contacts;
  Random random = new Random();
  int randomN = 0;
  bool noteAdded = false;
  TextEditingController noteController = TextEditingController();
  @override
  void initState() {
    getContact();
    super.initState();
  }

  getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts();
      randomN = random.nextInt(contacts!.length);
      setState(() {});

      print(contacts![randomN].displayName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Contact'),
        automaticallyImplyLeading: false,
      ),
      body: contacts == null
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[200]),
                    child: noteAdded
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('You have added a Note')],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Contact Name:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    contacts![randomN].displayName,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                      onPressed: () async {
                                        if (noteController.text
                                            .trim()
                                            .isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              'Note can\'t be empty',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            backgroundColor: Colors.red,
                                            duration: Duration(seconds: 3),
                                          ));
                                          return;
                                        }
                                        await FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('contactNotes')
                                            .doc()
                                            .set({
                                          'contactName':
                                              contacts![randomN].displayName,
                                          'dateTime': DateTime.now(),
                                          'note': noteController.text
                                        });
                                        setState(() {
                                          noteAdded = true;
                                        });
                                      },
                                      child: Text('Save'))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Enter Your message here",
                                  hintStyle: TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                controller: noteController,
                                maxLines: 4,
                              ),
                            ],
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection('contactNotes')
                        .orderBy('dateTime', descending: true)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.data!.docs.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Text(
                              'No Notes to Display',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.orange[200]),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Contact Name:",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data!.docs[index]
                                              ['contactName'],
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4),
                                      child: Divider(
                                        thickness: 2,
                                      ),
                                    ),
                                    Text('Note : ' +
                                        snapshot.data!.docs[index]['note'])
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                )
              ],
            )),
    );
  }
}
