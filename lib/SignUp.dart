import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Create New Account',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              SizedBox(
                height: 80,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 1),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(25.0),
                    // ),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 1),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 1),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // TextButton(
              //   onPressed: () {
              //     //forgot password screen
              //   },
              //   child: Text(
              //     'Forgot Password',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold, color: Colors.pink[300]),
              //   ),
              // ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () async {
                  try {
                    await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim())
                        .then((value) async {
                      if (value.user != null) {
                        Map<String, dynamic> userInfoMap = {
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "email": emailController.text.trim(),
                          "name": nameController.text.trim(),
                        };
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(userInfoMap['uid'])
                            .set(userInfoMap, SetOptions(merge: true));
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('email', emailController.text.trim());

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      }
                    });
                  } on FirebaseAuthException catch (e) {
                    print(e.message);
                  }
                },
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.pink[300],
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    )),
              ),
              Row(
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
