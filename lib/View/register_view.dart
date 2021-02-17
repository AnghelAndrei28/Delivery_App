import 'package:delivery_project/View/frame_customer.dart';
import 'package:delivery_project/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'customer_login_view.dart';

class CustomerRegister extends StatefulWidget {
  _CustomerRegister createState() => _CustomerRegister();
}

class _CustomerRegister extends State<CustomerRegister> {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController passwordConfirmationTextEditingController =
      TextEditingController();

  void _customerLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2e282a),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40, 100, 40, 65),
              decoration: BoxDecoration(
                color: Color(0xFFffcd3c),
                border: Border.all(),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlatButton(
                          child: Text("Sign In"),
                          onPressed: _customerLoginPage,
                          textColor: Colors.white,
                          color: Colors.indigoAccent,
                          splashColor: Colors.white.withOpacity(0.5),
                        ),
                        FlatButton(
                          child: Text("Sign Up"),
                          textColor: Colors.white,
                          color: Colors.indigoAccent,
                          splashColor: Colors.white.withOpacity(0.5),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(children: [
                        TextField(
                          controller: usernameTextEditingController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'Email'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordTextEditingController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordConfirmationTextEditingController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password'),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 30,
                          width: 160,
                          child: FlatButton(
                            onPressed: () {
                              if (usernameTextEditingController.text.length <
                                  6) {
                                displayToastMessage(
                                    "Name must be at least 6 characters",
                                    context);
                              } else if (emailTextEditingController.text
                                      .contains("@curierat") ||
                                  !emailTextEditingController.text
                                      .contains("@")) {
                                displayToastMessage("Invalid Email", context);
                              } else if (passwordTextEditingController
                                      .text.length <
                                  6) {
                                displayToastMessage(
                                    "Password must be at least 6 characters",
                                    context);
                              } else if (passwordTextEditingController.text !=
                                  passwordConfirmationTextEditingController
                                      .text) {
                                displayToastMessage(
                                    "Password confirmation doesn't match Password",
                                    context);
                              } else {
                                registerNewUser(context);
                              }
                            },
                            child: Icon(Icons.arrow_forward),
                            textColor: Colors.white,
                            color: Colors.indigoAccent,
                            splashColor: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage("Error: " + errMsg, context);
    }))
        .user;

    if (firebaseUser != null) {
      Map userDataMap = {
        "username": usernameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "numarcomenzi": 0,
        "comanda1": "",
        "comanda2": "",
        "comanda3": "",
        "comanda4": "",
        "comanda5": "",
      };

      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Account has been created", context);
      Navigator.of(context).pop();
    } else {
      displayToastMessage("New user has not been created.", context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
