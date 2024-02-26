import 'package:flutter/material.dart';
import 'package:seproject/home/booked_events.dart';
import 'package:seproject/other/routes.dart';
import 'package:ticket_widget/ticket_widget.dart';

class BookedTicket extends StatefulWidget {
  final eventName, organiser, img, eventDate, eventTime, eventVenue;
  BookedTicket(
      {Key? key,
      this.eventName,
      this.organiser,
      this.img,
      this.eventDate,
      this.eventTime,
      this.eventVenue})
      : super(key: key);

  @override
  State<BookedTicket> createState() => _BookedTicketState();
}

class _BookedTicketState extends State<BookedTicket> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? eventDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: Colors.amber[200],

      // appBar: AppBar(
      //   backgroundColor: Colors.black26,
      // title: Align(
      //     alignment: Alignment.topLeft,
      //     child: Container(
      //       decoration: BoxDecoration(
      //           color: Colors.grey[300],
      //           borderRadius: BorderRadius.circular(20.0)),
      //       child: TextButton(
      //           onPressed: () {

      //             Navigator.pushNamed(context, Routes.navigator);
      //           },
      //           child: Icon(
      //             Icons.person,
      //             color: Colors.black,
      //           )),
      //     )),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.amber[200],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TicketWidget(
                width: 350,
                height: 520,
                isCornerRounded: true,
                padding: EdgeInsets.all(20),
                child: TicketData(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final eventName = args?['eventName'] ?? '';
    final organizer = args?['organizer'] ?? '';
    final eventDate = args?['eventDate'] ?? '';
    final eventTime = args?["eventTime"] ?? '';
    final eventVenue = args?['eventVenue'] ?? '';
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Align(
            //     alignment: Alignment.topLeft,
            //     child: Container(
            //       decoration: BoxDecoration(
            //           color: Colors.grey[300],
            //           borderRadius: BorderRadius.circular(20.0)),
            //       child: TextButton(
            //           onPressed: () {
            //             // Navigator.pushNamed(context, Routes.bookedEvents);
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => BookedEvents(),
            //                 ));
            //           },
            //           child: Icon(
            //             Icons.arrow_back,
            //             color: Colors.black,
            //           )),
            //     )),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                eventName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                organizer,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ticketDetailsWidget(
                      'First Name', 'First name', 'UID', 'UID number'),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: ticketDetailsWidget('Last Name', 'Last name',
                        'Year and Course', 'Year and Course'),
                  ),
                  SizedBox(height: 32.0),
                  DashedLine(),
                ],
              ),
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 10.0),
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                    child: Text(
                      'Date: $eventDate',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 10.0),
                    child: Icon(
                      Icons.access_time,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                    child: Text(
                      'Time: $eventTime',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, bottom: 10.0),
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                    child: Text(
                      'Venue: $eventVenue',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Confirmed',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: (30.0),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}

class DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final double dashWidth = 5.0;
    final double dashSpace = 5.0;

    double currentX = 0.0;
    final double endX = size.width;

    while (currentX < endX) {
      canvas.drawLine(
        Offset(currentX, 0.0),
        Offset(currentX + dashWidth, 0.0),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
