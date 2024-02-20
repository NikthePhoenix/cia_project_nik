import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({
    Key? key,
  }) : super(key: key);

  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  static bool _isChecked1 = false;
  static bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;

  String collborators(bool ischecked, String departmentName) {
    Row(
      children: [
        Checkbox(
          value: ischecked,
          onChanged: (newValue) {
            setState(() {
              _isChecked1 = newValue!;
            });
          },
        ),
        SizedBox(width: 8),
        Text('ECC', style: TextStyle(fontSize: 16)),
      ],
    );
    
    return departmentName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Checkbox(
                value: _isChecked1,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked1 = newValue!;
                  });
                },
              ),
              SizedBox(width: 8),
              Text('ECC', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
              
                value: _isChecked2,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked2 = newValue!;
                  });
                },
              ),
              SizedBox(width: 8),
              Text('LFL', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: _isChecked3,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked3 = newValue!;
                  });
                },
              ),
              SizedBox(width: 8),
              Text('Fitoor', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: _isChecked4,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked4 = newValue!;
                  });
                },
              ),
              SizedBox(width: 8),
              Text('Ithaka', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CheckboxListTile(
                // title: Text("MVM"),
                value: _isChecked5,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked5 = newValue!;
                  });
                },
              ),
              SizedBox(width: 8),
              // Text('MVM', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                value: _isChecked6,
                onChanged: (newValue) {
                  setState(() {
                    _isChecked6 = newValue!;
                  });
                },
              ),
              SizedBox(width: 8),
              Text('WPA Dance', style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
