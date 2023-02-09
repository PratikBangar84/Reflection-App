import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/bottomnavbar.dart';
import 'package:flutter_application_5/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;
  String? error;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              SizedBox(
                height: 80,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) return 'Email can\'t be empty';
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val)) return 'Enter a valid email';
                    return null;
                  },
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
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.pink, width: 1),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(25.0),
                    // ),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink[300]),
                ),
              ),
              Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.pink[300],
                      borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: TextButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const CupertinoActivityIndicator();
                            },
                          );
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim());
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'email', emailController.text.trim());
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (Route<dynamic> route) => false);
                          } on FirebaseAuthException catch (e) {
                            Navigator.pop(context);
                            setState(() {
                              error = e.message;
                            });
                          }
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
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
