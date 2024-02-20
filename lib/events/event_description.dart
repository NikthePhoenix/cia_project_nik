import 'package:flutter/material.dart';
import 'package:seproject/home/booked_events.dart';
import 'package:seproject/events/events.dart';
import 'package:seproject/other/date_pick.dart';
import 'package:seproject/other/time_pick.dart';
import 'package:seproject/other/routes.dart';

class EventDescription extends StatefulWidget {
  final eventName, organiser, img;
  final isEventBooked;
  // static bool isBooked = false;
  // static bool isEventBooked = _EventDescriptionState.isEventBooked;
  static Map<String, dynamic> tickets = _EventDescriptionState.tickets;

  const EventDescription(
      {Key? key, this.eventName, this.organiser, this.img, this.isEventBooked})
      : super(key: key);

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  static List<String> bookedEvents = [];
  static Map<String, dynamic> tickets = {};

  static bool isEventBooked = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final eventName = args?['eventName'] ?? "";
    final organizer = args?['organizer'] ?? "";
    final eventVenue = args?['eventVenue'] ?? "";
    final image = args?['image'] ?? "";
    final eventDesc = args?['eventDesc'] ?? "";
    var isEventBooked = args?['isEventBooked'] ?? '';

    final String eventDate = DateSelectionScreen.eventDate;
    final String eventTime = TimeSelectionScreen.eventTime;

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                    width: double.infinity,
                    color: Colors.red,
                    child: Image.asset(
                      "assets/images/" + image,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.cover,
                    )),
                Text(
                  eventName,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  organizer,
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    Icon(Icons.date_range),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Date: $eventDate",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.timer_rounded),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Time: $eventTime",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Venue: $eventVenue",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    eventDesc,
                    // child: Text(
                    //   "Marshall Bruce Mathers III (born October 17, 1972)—otherwise known as Eminem—is a legendary hip-hop icon who started as an underground battle rapper in Detroit, Michigan. He developed a career full of controversy, wild swings, and some of the most noteworthy bars in the history of the genre.",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                    if (!bookedEvents.contains(eventName)) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Booking Confirmation"),
                              content: Text(
                                  "Are you sure about booking this event?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    print(eventName);

                                    bookedEvents.add(eventName);
                                    tickets['eventName'] = eventName;
                                    tickets['organizer'] = organizer;
                                    print(bookedEvents);
                                    await Future.delayed(Duration(seconds: 1));
                                    Navigator.pushNamed(
                                        context, Routes.bookedTicket,
                                        arguments: {
                                          'eventName': eventName,
                                          'organizer': organizer,
                                          'eventDate': eventDate,
                                          'eventTime': eventTime,
                                          'eventVenue': eventVenue
                                        });
                                  },
                                  child: Text("Proceed"),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: bookedEvents.contains(eventName)
                            ? Colors.grey
                            : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                              bookedEvents.contains(eventName)
                                  ? "Already Booked"
                                  : "Book Now",
                              style: bookedEvents.contains(eventName)
                                  ? TextStyle(fontSize: 20, color: Colors.white)
                                  : TextStyle(fontSize: 20)),
                          Icon(
                            Icons.arrow_forward,
                            color: bookedEvents.contains(eventName)
                                ? Colors.white
                                : Colors.black,
                          )
                        ]),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
