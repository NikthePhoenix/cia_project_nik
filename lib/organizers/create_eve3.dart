// import 'package:b/checkboxes.dart';
import 'package:flutter/material.dart';
import 'package:seproject/organizers/collaborators.dart';

void main() {
  runApp(MaterialApp(
    home: Create_event3(),
  ));
}

class Create_event3 extends StatelessWidget {
  const Create_event3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: MyEvent3(),
        ),
      ),
    );
  }
}

class MyEvent3 extends StatelessWidget {
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
                "Add Collaborators",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              SizedBox(
                height: 15,
              ),
              Wrap(
                children: [
                  Text(
                    "( You can collab with maximum 2 departments / committees )",
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CheckboxExample(),
              SizedBox(height: 100,),
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
