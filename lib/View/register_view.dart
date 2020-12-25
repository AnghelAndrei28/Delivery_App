import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer_login_view.dart';

class CustomerRegister extends StatefulWidget {
  _CustomerRegister createState() => _CustomerRegister();
}

class _CustomerRegister extends State<CustomerRegister> {
  void _customerLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerLogin()));
  }

  /*final myControllerUser = TextEditingController();
  final myControllerPass = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerUser.dispose();
    myControllerPass.dispose();
    super.dispose();
  }
*/
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
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password'),
                        ),
                        SizedBox(height: 30),
                         SizedBox(

                              height: 30,
                              width: 160,
                              child: FlatButton(
                                onPressed: _customerLoginPage,
                                    child: Icon(Icons.arrow_forward),
                                textColor: Colors.white,
                                color: Colors.indigoAccent,
                                splashColor: Colors.white.withOpacity(0.5),
                                 ),
                            ),
                        SizedBox(height: 30,)
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
}
