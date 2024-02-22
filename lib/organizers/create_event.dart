import 'package:flutter/material.dart';
import 'package:seproject/other/Image_pic_pre.dart';
import 'package:seproject/organizers/collaborators.dart';

import 'package:seproject/other/date_pick.dart';
import 'package:seproject/other/time_pick.dart';
import 'package:seproject/other/routes.dart';
import 'collaborators.dart';

class Create_event extends StatefulWidget {
  const Create_event({Key? key}) : super(key: key);
  static Map<String, dynamic> created_events =
      _Create_eventState.created_events;

  @override
  State<Create_event> createState() => _Create_eventState();
}

class _Create_eventState extends State<Create_event> {
  TextEditingController eventName = TextEditingController();
  TextEditingController eventVenue = TextEditingController();
  TextEditingController eventDesc = TextEditingController();
  // TextEditingController eventTime = TextEditingController();
  String eventDate = DateSelectionScreen.eventDate;
  static Map<String, dynamic> created_events = {};

  String collaborator = "";

  final List<String> collaborators = [
    "ECC",
    "Fitoor",
    "Ithaka",
    "LFL",
    "MVM",
    "Wpa Dance"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          // Set grey background color
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Event",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Upload Event Image :",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Image_pic_pre(),
              SizedBox(
                height: 40,
              ),
              Text(
                " Enter Event Name :",
                style: TextStyle(fontSize: 18),
              ),
              InputField(
                hintText: 'Enter Event Name',
                controller: eventName,
              ),
              SizedBox(height: 30.0),
              Text(
                " Enter Event Date :",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              DateSelectionScreen(),
              SizedBox(height: 30.0),
              Text(
                " Enter Event Time :",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TimeSelectionScreen(),
              SizedBox(height: 30.0),
              Text(
                " Enter Event Venue :",
                style: TextStyle(fontSize: 18),
              ),
              InputField(
                hintText: 'Enter Event Venue',
                controller: eventVenue,
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 25,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                " Enter Event ECC Points : ",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Event ECC Points ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 234, 237),
                  )),
              SizedBox(height: 30.0),
              Text(
                " Enter Event Max Capacity :",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter Event Max Capacity ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 234, 237),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                " Enter Event Description :",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                  maxLines: 8,
                  controller: eventDesc,
                  decoration: InputDecoration(
                    hintText: "Enter Event Description ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 234, 237),
                  )),
              SizedBox(
                height: 30,
              ),
              Divider(
                height: 25,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Chose the organizer department",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: collaborators[0],
                        groupValue: collaborator,
                        onChanged: (String? value) {
                          setState(() {
                            collaborator = value!;
                          });
                          print(collaborator);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(collaborators[0], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: collaborators[1],
                        groupValue: collaborator,
                        onChanged: (String? value) {
                          setState(() {
                            collaborator = value!;
                          });
                          print(collaborator);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(collaborators[1], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: collaborators[2],
                        groupValue: collaborator,
                        onChanged: (String? value) {
                          setState(() {
                            collaborator = value!;
                          });
                          print(collaborator);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(collaborators[2], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: collaborators[3],
                        groupValue: collaborator,
                        onChanged: (String? value) {
                          setState(() {
                            collaborator = value!;
                          });
                          print(collaborator);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(collaborators[3], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: collaborators[4],
                        groupValue: collaborator,
                        onChanged: (String? value) {
                          setState(() {
                            collaborator = value!;
                          });
                          print(collaborator);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(collaborators[4], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: collaborators[5],
                        groupValue: collaborator,
                        onChanged: (String? value) {
                          setState(() {
                            collaborator = value!;
                          });
                          print(collaborator);
                        },
                      ),
                      SizedBox(width: 8),
                      Text(collaborators[5], style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.black, width: 1.0),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      "Create Event ",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    print(eventName.text);
                    created_events['eventName'] = eventName.text;
                    created_events['organizer'] = collaborator;
                    created_events['eventVenue'] = eventVenue.text;
                    created_events['eventDate'] = eventDate;
                    created_events['eventDesc'] = eventDesc.text;
                    print(created_events);
                    Navigator.pushNamed(context, Routes.events, arguments: {
                      'eventName': eventName.text,
                      'organizer': collaborator,
                      'eventVenue': eventVenue.text,
                      'eventDate': eventDate,
                      'eventDesc': eventDesc.text
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String handleCollaboratorSelection(department) {
    Radio(
      value: department,
      groupValue: collaborator,
      onChanged: (value) {
        setState(() {
          collaborator = value!;
        });
        print(collaborator);
      },
    );
    return collaborator;
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const InputField({Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Color.fromARGB(255, 236, 234, 237),
      ),
    );
  }
}
