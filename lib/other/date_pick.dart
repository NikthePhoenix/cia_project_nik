import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionScreen extends StatefulWidget {
  static String eventDate = "";
  @override
  _DateSelectionScreenState createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  static DateTime selectedDate = DateTime.now();
  late String date;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date = DateFormat('MMMM dd, yyyy').format(selectedDate);
        DateSelectionScreen.eventDate = date;
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
              _selectDate(context);
            },
            child: InputDecorator(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                filled: true,
                fillColor: Color.fromARGB(255, 232, 231, 233),
                suffixIcon: Icon(Icons.calendar_today),
              ),
              child: Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
