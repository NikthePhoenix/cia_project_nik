import 'package:flutter/material.dart';
import 'package:seproject/other/routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String str = "";
  final TextEditingController uname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    uname.dispose();
    pass.dispose();
    super.dispose();
  }

  bool isReadOnly = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: Text("AboutUs Bar"),
          title: ElevatedButton(
            child: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextButton(
                    onPressed: () {
                      isReadOnly = false;
                      print(isReadOnly);
                    },
                    child: Text(
                      textAlign: TextAlign.justify,
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE6E6E6),
                    radius: 30,
                    child: Icon(
                      Icons.person_rounded,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: uname,
                    readOnly: isReadOnly,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (str) => {
                      print("onChanged: " + str + " controller: " + uname.text)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kindly enter correct username";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      labelText: 'Email ID',
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (str) => {
                      print("onChanged: " + str + " controller: " + email.text)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kindly enter correct username";
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'UID',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: pass,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: UnderlineInputBorder(),
                    ),
                    onChanged: (str) => {
                      print("onChanged: " + str + " controller: " + pass.text)
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Kindly enter correct username";
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () {},
                  ),
                ),

                //CAN REMOVE SNACKBAR IF REQUIRED.
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Form Submitted')),
                        );
                        uname.text = pass.text = "";
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
