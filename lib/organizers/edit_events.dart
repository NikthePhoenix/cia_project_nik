import 'package:flutter/material.dart';
import 'package:seproject/organizers/create_event.dart';
import 'package:seproject/other/api_calls.dart';
import 'package:seproject/other/routes.dart';

class EditEvents extends StatefulWidget {
  const EditEvents({Key? key}) : super(key: key);

  @override
  State<EditEvents> createState() => _EditEventstate();
}

class _EditEventstate extends State<EditEvents> {
  static Map<String, dynamic> created_events = Create_event.created_events;
  //TODO change this shit
  static const dept = "ECC";
  Future<dynamic> events = ApiRequester.getEventbyDept(dept);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
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
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                future: events,
                builder: (context, snapshot) {
                  List<Widget> children = [];
                  if (snapshot.hasData) {
                    for (var event in snapshot.data) {
                      children.add(addBookedEvent(event['eventName'],
                          event['organizer']['orgName'], event['url']));
                    }
                  }
                  return Column(
                    children: children,
                  );
                },
              )
            ],
          ),
        )),
      )),
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
                child: Image.network(image,
                    height: 150, width: 150, fit: BoxFit.cover),
              ),
              Column(
                children: [
                  Text(eventName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis)),
                  Text(organizer,
                      style: TextStyle(
                        fontSize: 17,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Row(
                      children: [
                        Text("  Created  ",
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Icon(Icons.done_all_rounded)
                      ],
                    ),
                  ),
                  InkWell(
                    child: TextButton(
                      onPressed: () {
                        print(created_events);
                        Navigator.pushNamed(context, Routes.updateEvents,
                            arguments: {
                              'eventName': eventName,
                              // 'organizer': organizer,
                              // 'eventDate': eventDate,
                              // 'eventTime': eventTime,
                              // 'eventVenue': eventVenue
                            });
                      },
                      child: Text("Update Event"),
                    ),
                  ),
                  InkWell(
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Delete Event"),
                    ),
                  )
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
