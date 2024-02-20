// ignore_for_file: prefer_const_constructors

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../other/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController uidcontroller = TextEditingController();

  bool isButtonClicked = false;
  bool valid = false;
  bool isPwdVisible = false;
  bool signUp = false;
  bool forgotPwd = false;
  String errorMsg = "";

  final _formKey = GlobalKey<FormState>();

  Future<void> checkData(String uid, String password) async {
    print("UID is " + uid.toString());
    Response response = await post(Uri.http("localhost:3000", "user/login/"),
        headers: {"Content-Type": "application/json"},
        body: {"uid": uid, "password": password});

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, Routes.homePage);
    } else if (response.statusCode == 201) {
      print("Incorrect Password");
    } else {
      print("Empty Password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    "Login to your existing account",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  // Uid Input
                  TextFormField(
                    controller: uidcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Uid field can't be empty";
                      }

                      if (value.length > 7) {
                        return "Please enter valid UID";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Enter UID",
                        prefixIcon: Icon(Icons.perm_identity_outlined)),
                  ),
                  SizedBox(height: 20.0),
                  // email id
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email field can't be empty";
                      }
                      bool isEmailValid = RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                      ).hasMatch(value);

                      if (!isEmailValid) {
                        return "Please enter valid email";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // password
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password field can't be empty";
                      }
                      if (value.length <= 4) {
                        return "Password should have minimum 4 characters";
                      }
                    },
                    obscureText: isPwdVisible ? false : true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Enter Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPwdVisible = !isPwdVisible;
                          });
                        },
                        child: Icon(isPwdVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // checkData(uidcontroller.text, passwordController.text);
                        Navigator.pushNamed(context, Routes.verifyAccount);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Material(
                    borderRadius: BorderRadius.circular(35),
                    // color: Colors.deepPurple[700],
                    color: Colors.black87,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isButtonClicked = true;
                        });

                        await Future.delayed(Duration(seconds: 2));
                        if (_formKey.currentState!.validate()) {
                          valid = true;
                          // print("Successs");
                          print("email: ${emailController.text}");
                          print("Password: ${passwordController.text}");
                          // await checkData(
                          //     uidcontroller.text, passwordController.text);
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.navigator,
                          );
                          uidcontroller.clear();
                          passwordController.clear();
                          // await Navigator.pushNamed(
                          //   context,
                          //   Routes.navigator,
                          // );
                          // next
                          //     ? await Navigator.pushReplacementNamed(
                          //         context,
                          //         Routes.homePage,
                          //       )
                          //     : print("");
                        }

                        setState(() {
                          isButtonClicked = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50.0,
                        width: valid ? 50.0 : 100.0,
                        alignment: Alignment.center,
                        child:  valid
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text("Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Visibility(
                    visible: isButtonClicked,
                    child: Text(
                      valid
                          ? "${emailController.text} logging in..."
                          : errorMsg, // ERROR: error msg is null everytime
                      style:
                          TextStyle(color: valid ? Colors.green : Colors.red),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(fontSize: 16)),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.signUp,
                            );
                          });
                        },
                        child: Text("Sign Up", style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    ));
  }
}
