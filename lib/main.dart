import 'package:flutter/material.dart';
import 'package:flutter_application_5/bottomnavbar.dart';
import 'package:flutter_application_5/catogaries.dart';
import 'package:flutter_application_5/homescreen.dart';
import 'package:flutter_application_5/Navbar/secondpage.dart';
import 'package:flutter_application_5/textscreenog.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: 'Login',
    routes: {'Login': (context) => homepage()},
  ));
}
