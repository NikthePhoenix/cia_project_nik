import 'package:flutter/material.dart';
import 'package:seproject/organizers/create_event.dart';
import 'package:seproject/other/routes.dart';

class UpdateEvent extends StatefulWidget {
  const UpdateEvent({Key? key}) : super(key: key);

  @override
  State<UpdateEvent> createState() => _UpdateEventState();
}

class _UpdateEventState extends State<UpdateEvent> {
  static Map<String, dynamic> created_events = Create_event.created_events;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20.0)),
                        child: TextButton(
                            onPressed: () {
                              // Navigator.pushNamed(context, Routes.bookedEvents);
                              Navigator.pushNamed(
                                context,
                                Routes.navigator,
                              );
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                      )),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      addBookedEvent("Open mic", "ECC & LFL", "open_mic.jpg"),
                      SizedBox(
                        height: 10,
                      ),
                      addBookedEvent(created_events?["eventName"] ?? "",
                          created_events?['organizer'] ?? "", "open_mic.jpg"),
                    ],
                  )
                ],
              )))),
    );
  }

  Widget addBookedEvent(eventName, organizer, image) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Booking Confirmation"),
                content: Text("Are you sure about booking this event?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () async {
                      // k
                    },
                    child: Text("Proceed"),
                  ),
                ],
              );
            });
      },
      child: Container(
        width: MediaQuery.of(context)!.size.width * 0.75,
        decoration: BoxDecoration(
            border: Border.all(width: 2.0),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/images/" + image,
                    height: 150, width: 150, fit: BoxFit.cover),
              ),
              Column(
                children: [
                  Text(eventName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(organizer,
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Row(
                      children: [
                        Text("  Booked  ",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Icon(Icons.done_all_rounded)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
