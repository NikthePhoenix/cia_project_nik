// ignore_for_file: prefer_const_constructors

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:seproject/other/routes.dart';
// import 'package:seproject/user_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final departments = {"ECC", "MVM", "IMG", "SSL"};

  // int
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // minimum: EdgeInsets.symmetric(horizontal: 5),

        child: Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Whats your plans for today?",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                // SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    // Navigate to the events not yet booked
                  },
                  child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Upcoming events",
                            style: TextStyle(fontSize: 20),
                          ),

                          // SizedBox(width: 3),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )),
                ),

                InkWell(
                  onTap: () {
                    // Navigate to the events that have been booked already
                    Navigator.pushNamed(context, Routes.bookedEvents);
                  },
                  child: Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Booked Events",
                            style: TextStyle(fontSize: 20),
                          ),

                          // SizedBox(width: 3),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      )),
                ),
              ]),
        ),
      ),
    );
  }

  Widget addSection(String departmentName) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, Routes.departments);
      },
      child: Container(
          height: 100,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                departmentName,
                style: TextStyle(fontSize: 20),
              ),

              // SizedBox(width: 3),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
    // SizedBox(height: 15),
  }
}
