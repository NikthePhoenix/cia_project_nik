// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:seproject/other/routes.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmedController = TextEditingController();

  bool isPwdVisible = false;
  bool isConfirmPwdVisible = false;
  bool isButtonClicked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Set New Password",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password field can't be empty";
                        }
                        if (value.length < 4) {
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
                    SizedBox(height: 20),
                    // confirm password
                    TextFormField(
                      obscureText: isConfirmPwdVisible ? false : true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Kindly confirm password";
                        } else if (passwordController.text != value) {
                          return "Password is not matching";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isConfirmPwdVisible = !isConfirmPwdVisible;
                                });
                              },
                              child: Icon(isConfirmPwdVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30.0),
                    Material(
                      borderRadius: BorderRadius.circular(35),
                      // color: Colors.deepPurple[700],
                      color: Colors.black87,
                      child: InkWell(
                        onTap: () async {
                          setState(() {
                            isButtonClicked = true;
                          });

                          await Future.delayed(Duration(seconds: 5));
                          if (_formKey.currentState!.validate()) {
                            await Navigator.pushNamed(
                                context, Routes.loginPage);
                            if (passwordController.text ==
                                confirmedController) {
                              // to move to login page only if passwords in both fields matches
                            }
                          }

                          setState(() {
                            isButtonClicked = false;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          height: 50.0,
                          width: isButtonClicked ? 50.0 : 100.0,
                          alignment: Alignment.center,
                          child: isButtonClicked //&& valid
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
                  ]),
            )));
  }
}
