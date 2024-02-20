import 'package:flutter/material.dart';
import 'package:seproject/other/routes.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    child: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      textAlign: TextAlign.left,
                      "About Us",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Text(
                      "Welcome to BookMyEvents",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    "At BookMyEvents, we believe in the power of connection, collaboration, and community. \n"
                    "Born out of the passion and creativity of a group of enthusiastic college students, our "
                    "app is designed to make organizing and booking college events a seamless and enjoyable experience. \n"
                    "We are a team passionate about making a platform for college students to be able to book events according "
                    "to departments and fests! "
                    "We understand the unique needs of college students, and our app reflects that "
                    "understanding. With a user-centric design, intuitive interface, and robust features,Book My Event is crafted "
                    "to enhance your event booking experience.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                // Divider(
                //   height: 15,
                //   thickness: 2,
                //   indent: 15,
                //   endIndent: 15,
                //   color: Colors.grey,
                // ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
