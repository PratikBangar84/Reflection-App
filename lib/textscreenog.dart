import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_editor/text_editor.dart';

class AddQuote extends StatefulWidget {
  @override
  State<AddQuote> createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {
  Map colors = {
    0xffdee0f3: false,
    0xfff9e6f9: false,
    0xffe4c7f2: false,
    0xfffcfee5: false,
    0xfffee3d2: false,
    0xfff0ffda: false
  };
  String? url;
  var post;

  var background = Colors.white;
  TextEditingController body = TextEditingController();
  TextEditingController title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              onPressed: () async {
                final tempImage = await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: 95);
                if (tempImage != null) {
                  post = File(tempImage.path);
                }
              },
              icon: Icon(Icons.add_a_photo_outlined)),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  elevation: 0,
                  isDismissible: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return SizedBox(
                      height: 100,
                      child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: colors.entries.map(
                            (e) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      background = Color(e.key);
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(e.key)),
                                  ),
                                ),
                              );
                            },
                          ).toList()),
                    );
                  },
                );
              },
              icon: Icon(Icons.color_lens_outlined))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          onPressed: () async {
            if (title.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Title can\'t be empty',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ));
              return;
            }
            if (body.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'body can\'t be empty',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ));
              return;
            }
            if (post == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'please select an image',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ));
              return;
            }

            Reference ref = FirebaseStorage.instance
                .ref()
                .child('posts/${FirebaseAuth.instance.currentUser!.uid}')
                .child(FirebaseAuth.instance.currentUser!.uid +
                    '-${DateTime.now().toString()}');
            UploadTask task = ref.putFile(post);
            task.whenComplete(() async {
              url = await ref.getDownloadURL();

              await FirebaseFirestore.instance.collection('posts').doc().set({
                'title': title.text.trim(),
                'body': body.text.trim(),
                'createdBy': FirebaseAuth.instance.currentUser!.uid,
                'dateTime': DateTime.now(),
                'image': url,
              });
            });
          },
          label: Text('Submit'),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: TextField(
              controller: title,
              style: TextStyle(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.title,
                  color: Colors.grey,
                ),
                counterText: '',
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade600, width: 1.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(22, 20, 22, 50),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Enter Your message here",
                hintStyle: TextStyle(color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: body,
              maxLines: 10,
            ),
          ),
        ],
      )),
    );
  }
}
