import 'package:flutter/material.dart';
import 'package:seproject/events/event_description.dart';
import 'package:seproject/other/api_calls.dart';
import 'package:seproject/other/routes.dart';

class BookedEvents extends StatefulWidget {
  const BookedEvents({Key? key}) : super(key: key);
  static bool isEventBooked = isEventBooked;

  @override
  State<BookedEvents> createState() => _BookedEventsState();
}

class _BookedEventsState extends State<BookedEvents> {
  static bool isEventBooked = false;
  static Map<String, dynamic>? tickets = EventDescription.tickets;
  Future<dynamic> bookedEvents = ApiRequester.getBookedTickets(222333);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
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
                              )),
                        )),
                    FutureBuilder(
                        future: bookedEvents,
                        builder: (context, snapshot) {
                          List<Widget> children = [];
                          if (snapshot.hasData) {
                            for (var entry in snapshot.data["events"]) {
                              dynamic event = entry["event"];
                              children.add(addBookedEvent(
                                event["eventName"] ?? "",
                                "Organizer" ?? "",
                                event["url"],
                              ));
                            }
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: children,
                          );
                        })
                  ],
                ),
              )))),
    );
  }

  Widget addBookedEvent(eventName, organizer, image) {
    return InkWell(
      child: Container(
        // width: MediaQuery.of(context)!.size.width * 0.75,
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
