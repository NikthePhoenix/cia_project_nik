// import 'package:b/create_eve3.dart';
import 'package:flutter/material.dart';
import 'package:seproject/organizers/create_eve3.dart';

void main() {
  runApp(MaterialApp(
    home: Create_event2(),
  ));
}

class Create_event2 extends StatelessWidget {
  const Create_event2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: MyEvent2(),
        ),
      ),
    );
  }
}

class MyEvent2 extends StatelessWidget {
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
              SizedBox(
                height: 40,
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
                height: 40,
              ),
              Text(
                " Enter Event Description :",
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: "Enter Event Description ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Color.fromARGB(255, 236, 234, 237),
                  )),
              SizedBox(
                height: 40,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.black, width: 1.0),
                ),
                child: ListTile(
                  trailing: Icon(
                    Icons.arrow_forward,
                    size: 35,
                  ),
                  title: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Create_event3()));
                  },
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

  const InputField({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        filled: true,
        fillColor: Color.fromARGB(255, 236, 234, 237),
      ),
    );
  }
}
