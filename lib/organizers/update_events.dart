import 'package:flutter/material.dart';
import 'package:seproject/events/event_description.dart';
import 'package:seproject/organizers/create_event.dart';
import 'package:seproject/other/Image_pic_pre.dart';
import 'package:seproject/other/date_pick.dart';
import 'package:seproject/other/routes.dart';
import 'package:seproject/other/time_pick.dart';

class UpdateEvents extends StatefulWidget {
  final eventName;
  static Map<String, dynamic> updated_events =
      _UpdateEventsState.updated_events;
  const UpdateEvents({Key? key, this.eventName}) : super(key: key);

  @override
  State<UpdateEvents> createState() => _UpdateEventsState();
}

class _UpdateEventsState extends State<UpdateEvents> {
  TextEditingController updatedEventName = TextEditingController();
  TextEditingController updatedEventVenue = TextEditingController();
  TextEditingController updatedEventDesc = TextEditingController();
  TextEditingController updatedEventTime = TextEditingController();
  String eventDate = DateSelectionScreen.eventDate;
  static Map<String, dynamic> created_events = Create_event.created_events;

  static Map<String, dynamic> updated_events = {};

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
    final Map<String, dynamic>? eventDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final eventName = eventDetails?['eventName'] ?? "";
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
                "Update Event",
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
                " Update Event Name :",
                style: TextStyle(fontSize: 18),
              ),
              InputField(
                hintText: 'Update Event Name',
                controller: updatedEventName,
                // defaultValue: created_events['eventName'] ?? "",
              ),
              SizedBox(height: 30.0),
              Text(
                " Update Event Date :",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              DateSelectionScreen(),
              SizedBox(height: 30.0),
              Text(
                " Update Event Time :",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              TimeSelectionScreen(),
              SizedBox(height: 30.0),
              Text(
                " Update Event Venue :",
                style: TextStyle(fontSize: 18),
              ),
              InputField(
                hintText: 'Update Event Venue',
                controller: updatedEventVenue,
                // defaultValue: created_events['eventVenue'] ?? "",
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
                " Update Event ECC Points : ",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Update Event ECC Points ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 234, 237),
                  )),
              SizedBox(height: 30.0),
              Text(
                " Update Event Max Capacity :",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Update Event Max Capacity ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 234, 237),
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                " Update Event Description :",
                style: TextStyle(fontSize: 18),
              ),
              TextFormField(
                  maxLines: 8,
                  controller: updatedEventDesc,
                  // initialValue: created_events['eventDesc'] ?? "",
                  decoration: InputDecoration(
                    hintText: "Update Event Description ",
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
                      "Update Event ",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String hintText;
  final controller;

  const InputField({Key? key, required this.hintText, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // initialValue: defaultValue,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Color.fromARGB(255, 236, 234, 237),
      ),
    );
  }
}
