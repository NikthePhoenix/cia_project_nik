import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seproject/events/event_description.dart';
import 'package:seproject/other/Image_pic_pre.dart';
import 'package:seproject/other/routes.dart';

class Events extends StatefulWidget {
  final eventName, eventVenue, organizer, eventDate, eventDesc;

  const Events(
      {Key? key,
      this.eventName,
      this.organizer,
      this.eventVenue,
      this.eventDate,
      this.eventDesc})
      : super(key: key);
  // const Events({Key? key,}): super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  // Widget departmentsList() {
  //   // use ListView.buildera() instead of row
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       SizedBox(height: 10),
  //       addDepartmentTiles("ECC"),
  //       SizedBox(width: 15),
  //       addDepartmentTiles("MVM"),
  //       SizedBox(width: 15),
  //       addDepartmentTiles("IMG"),
  //       SizedBox(width: 15),
  //       addDepartmentTiles("SSL"),
  //     ],R
  //   );
  // }
  Widget addEvents(eventName, organizer, eventVenue, eventDesc,  image,) {
    return InkWell(
      onTap: () {
        print(eventVenue);
        Navigator.pushNamed(context, Routes.eventDescription, arguments: {
          'eventName': eventName,
          'organizer': organizer,
          'eventVenue': eventVenue,
          'eventDesc': eventDesc,
          'image': image,
          'isEventBooked': false
        });
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: [
              // Container(
              //   child: Image.asset("assets/images/" + image + ".jpg",
              //       height: 100, width: 100, fit: BoxFit.cover),
              // ),
              Container(
                child: Image.asset("assets/images/" + image,
                    height: 100, width: 100, fit: BoxFit.cover),
              ),
              Text(
                eventName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(organizer,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300))
            ],
          )),
    );
  }

  Widget eventsList(BuildContext context) {
    Map<String, dynamic>? eventDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final eventName = eventDetails?['eventName'] ?? "";
    final organizer = eventDetails?['organizer'] ?? "";
    final eventVenue = eventDetails?['eventVenue'] ?? "";
    final eventDesc = eventDetails?['eventDesc'] ?? "";
    File? imageFile = Image_pic_pre.getImageFile();
    // final imageName = Image_pic_pre.getImageFileName() ?? "";
    final imageName = "main.jpeg";

    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 10.0,
          runSpacing: 15.0,
          children: [
            addEvents(eventName, "ecc& wpa", eventVenue, eventDesc,  imageName, ),
            addEvents("Dancer", "WPA", "", "", "demo_event.jpg"),
            addEvents("Hip Hop", "ECC & WPA",  "", "", "open_mic.jpg" ),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
            addEvents("Hip Hop", "ECC & WPA", "", "", "open_mic.jpg"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20.0)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Navigator.push
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                )),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Center(
                      child: Text("EVENTS",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 10),
                  // SingleChildScrollView(
                  //     scrollDirection: Axis.horizontal,
                  //     child: departmentsList()),
                  SizedBox(height: 20),
                  Expanded(
                    child: eventsList(context),
                  )
                ],
              )))),
    );
  }
}
