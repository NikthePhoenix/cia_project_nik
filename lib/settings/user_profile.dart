import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seproject/other/color_palette.dart';
import 'package:seproject/other/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String str = "";
  final TextEditingController uname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    uname.dispose();
    pass.dispose();
    super.dispose();
  }

  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(background_darkgrey),
        appBar: AppBar(
            backgroundColor: Color(background_darkgrey),
            // title: Text("AboutUs Bar"),
            // title: ElevatedButton(
            //   child: const Icon(Icons.arrow_back, color: Color(background_darkgrey),),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            title: Container(
              decoration: BoxDecoration(
                  color: Color(golden_yellow),
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.events);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(background_darkgrey),
                  )),
            )),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      isReadOnly = false;
                      print(isReadOnly);
                    },
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Edit Profile",
                      style: TextStyle(
                        color: Color(text_dm_offwhite),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: CircleAvatar(
                    backgroundColor: Color(golden_yellow),
                    radius: 30,
                    child: Icon(
                      Icons.person_rounded,
                      color: Color(background_darkgrey),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: uname,
                    readOnly: isReadOnly,
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: Color(background_darkgrey)),
                        fillColor: Color(text_dm_offwhite),
                        filled: true),
                    cursorColor: Color(background_darkgrey),
                    style: TextStyle(color: Color(background_darkgrey)),
                    onChanged: (str) => {
                      print("onChanged: " + str + " controller: " + uname.text)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kindly enter correct username";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                        labelText: 'Email ID',
                        labelStyle:
                            TextStyle(color: Color(background_darkgrey)),
                        fillColor: Color(text_dm_offwhite),
                        filled: true),
                    cursorColor: Color(background_darkgrey),
                    style: TextStyle(color: Color(background_darkgrey)),
                    onChanged: (str) => {
                      print("onChanged: " + str + " controller: " + email.text)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kindly enter correct username";
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'UID',
                        labelStyle:
                            TextStyle(color: Color(background_darkgrey)),
                        fillColor: Color(text_dm_offwhite),
                        filled: true),
                    cursorColor: Color(background_darkgrey),
                    style: TextStyle(color: Color(background_darkgrey)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: pass,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: Color(background_darkgrey)),
                        fillColor: Color(text_dm_offwhite),
                        filled: true),
                    cursorColor: Color(background_darkgrey),
                    style: TextStyle(color: Color(background_darkgrey)),
                    onChanged: (str) => {
                      print("onChanged: " + str + " controller: " + pass.text)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kindly enter correct username";
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    // child: ElevatedButton(
                    //   child: const Text('Logout', style: TextStyle(color: Color(background_darkgrey)),),
                    //   onPressed: () {},
                    // ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(golden_yellow),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Logout",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Color(background_darkgrey)))),
                    )),

                //CAN REMOVE SNACKBAR IF REQUIRED.
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color(golden_yellow),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Form Submitted')),
                            );
                            uname.text = pass.text = "";
                          }
                        },
                        child: Text("Submit",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color(background_darkgrey))),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
