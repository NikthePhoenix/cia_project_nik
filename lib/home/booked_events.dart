import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seproject/events/event_description.dart';
import 'package:seproject/other/api_calls.dart';
import 'package:seproject/other/routes.dart';
import 'package:seproject/other/color_palette.dart';
import 'package:seproject/organizers/og_login.dart';

class BookedEvents extends StatefulWidget {
  const BookedEvents({Key? key}) : super(key: key);
  static bool isEventBooked = isEventBooked;

  @override
  State<BookedEvents> createState() => _BookedEventsState();
}

class _BookedEventsState extends State<BookedEvents> {
  //
  static bool isEventBooked = false;
  static Map<String, dynamic>? tickets = EventDescription.tickets;
  //change the uid user signed in
  Future<dynamic> bookedEvents = ApiRequester.getBookedTickets(222333);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(background_darkgrey),
      appBar: AppBar(
        backgroundColor: Color(background_darkgrey),
        leading: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(golden_yellow),
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
      ),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Container(
                    //       decoration: BoxDecoration(
                    //           color: Color(golden_yellow),
                    //           borderRadius: BorderRadius.circular(20.0)),
                    //       child: TextButton(
                    //           onPressed: () {
                    //             // Navigator.pushNamed(context, Routes.bookedEvents);
                    //             Navigator.pushNamed(
                    //               context,
                    //               Routes.navigator,
                    //             );
                    //           },
                    //           child: Icon(
                    //             Icons.arrow_back,
                    //             color: Colors.black,
                    //           )),
                    //     )),
                        SizedBox(
                          height: 20,
                        ),
                    FutureBuilder(
                        future: bookedEvents,
                        builder: (context, snapshot) {
                          List<Widget> children = [];
                          if (snapshot.hasData) {
                            for (var entry in snapshot.data["events"]) {
                              dynamic event = entry["event"];
                              children.add(addBookedEvent(
                                event["eventName"] ?? "",
                                org["orgName"],
                                event["url"],
                              ));
                            }
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
            border: Border.all(width: 2.0, color: Color(golden_yellow)),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(image,
                    height: 150, width: 150, fit: BoxFit.cover),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(eventName,
                      style:
                          TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(text_dm_offwhite)
                      ),
                      overflow: TextOverflow.ellipsis),
                  Text(organizer,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(text_dm_offwhite)
                      ),
                      overflow: TextOverflow.ellipsis),
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
