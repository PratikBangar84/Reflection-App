import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

var email;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? LoginPage() : HomePage(),
  ));
}
