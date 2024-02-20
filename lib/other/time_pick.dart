import 'package:flutter/material.dart';

class TimeSelectionScreen extends StatefulWidget {
  static String eventTime = _TimeSelectionScreenState.time;
  @override
  _TimeSelectionScreenState createState() => _TimeSelectionScreenState();
}

class _TimeSelectionScreenState extends State<TimeSelectionScreen> {
  static TimeOfDay selectedTime = TimeOfDay.now();
  static String time = "";

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        // time = picked.toString().substring(10, 25);
        time = selectedTime.toString().substring(10, 15);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () {
              _selectTime(context);
            },
            child: InputDecorator(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Color.fromARGB(255, 232, 231, 233),
                suffixIcon: Icon(Icons.access_time),
              ),
              child: Text(
                '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
