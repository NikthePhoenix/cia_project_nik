// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:seproject/other/routes.dart';

class EmailVerification extends StatefulWidget {
  final uid;
  const EmailVerification({Key? key, this.uid}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController otpController = TextEditingController();
    bool isEmailSent = false;
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> _pincodekey =
        GlobalKey<FormFieldState<String>>();
    final Map user = ModalRoute.of(context)!.settings.arguments as Map;
    final uid = user['uid'];

    return Material(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email Verfication",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text("An OTP has been sent to your email",
                      style: TextStyle(fontSize: 18)),
                  Text("Enter the given OTP below",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(
                    height: 20.0,
                  ),
                  PinCodeTextField(
                    appContext: context,
                    controller: otpController,
                    length: 6,
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
                    onCompleted: (pin) async {
                      Map<String, dynamic> map = {'uid': uid, 'otp': pin};
                      Response response = await post(
                          Uri.http("localhost:3000", "users/otpcheck"),
                          body: map);

                      if (response.statusCode == 200) {
                        print("OTP valid");
                        Navigator.pushNamed(context, Routes.loginPage);
                      } else if (response.statusCode == 401) {
                        print("OTP Incorrect");
                      } else {
                        print("OTP Expired!");
                      }
                    },
                    onChanged: (value) {
                      // every time the value changes
                      // print("changed: $value");
                    },
                    key: _pincodekey,
                  ),
                  SizedBox(height: 20.0),
                ],
              ))),
    );
  }
}
