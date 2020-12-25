import 'package:delivery_project/View/customer_login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliverLogin extends StatefulWidget {
  _DeliverLogin createState() => _DeliverLogin();
}

class _DeliverLogin extends State<DeliverLogin> {
  void _customerPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerLogin()));
  }

  final myControllerUser = TextEditingController();
  final myControllerPass = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerUser.dispose();
    myControllerPass.dispose();
    super.dispose();
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
                    SizedBox(
                        height: 40,
                        child: Text(
                          'Deliver',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        )),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(children: [
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username'),
                          controller: myControllerUser,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                          controller: myControllerPass,
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 30,
                          width: 160,
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.indigoAccent,
                            splashColor: Colors.white.withOpacity(0.5),
                            onPressed: () {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    // Retrieve the text the user has entered by using the
                                    // TextEditingController.
                                    content: Text(myControllerUser.text +
                                        '  ' +
                                        myControllerPass.text),
                                  );
                                },
                              );
                            },
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                        SizedBox(height: 30),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
            padding: const EdgeInsets.only(bottom: 60),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
              child: Text('Log In as Customer'),
              onPressed: _customerPage,
            ))
      ]),
    );
  }
}
