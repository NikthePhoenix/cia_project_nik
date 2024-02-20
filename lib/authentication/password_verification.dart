// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seproject/other/routes.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController otpController = TextEditingController();
    bool isEmailSent = false;
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> _pincodekey =
        GlobalKey<FormFieldState<String>>();

    return Material(
        
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Verfication",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15.0),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email field can't be empty";
                      }
                      bool isEmailValid = RegExp(
                        r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
                      ).hasMatch(value);

                      if (!isEmailValid) {
                        return "Please enter valid email";
                      }
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      labelText: "Enter Email",
                      hintText: "Enter the registered email id",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        print("request for otp...");
                        // code to send otp through email
                      },
                      child: Text(
                        "Send OTP",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text("Enter the given OTP below",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 5.0,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 4,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    mainAxisAlignment: MainAxisAlignment.center,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50.0,
                        fieldWidth: 50.0,
                        activeColor: Colors.green,
                        activeFillColor: Colors.red,
                        fieldOuterPadding:
                            EdgeInsets.symmetric(horizontal: 7.0)),
                    onCompleted: (pin) {
                      // when the complete otp is entered
                      print("Entered OTP: $pin");
                      Navigator.pushNamed(
                          context, Routes.resetPassword);
                    },
                    onChanged: (value) {
                      // every time the value changes
                      print("changed: $value");
                    },
                    key: _pincodekey,
                  ),
                  SizedBox(height: 20.0),
                ],
              ))),
    );
  }
}
