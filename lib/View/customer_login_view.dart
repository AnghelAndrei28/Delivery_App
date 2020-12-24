import 'package:delivery_project/View/deliver_login_view.dart';
import 'package:delivery_project/View/frame_customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerLogin extends StatefulWidget {
  _CustomerLogin createState() => _CustomerLogin();
}

class _CustomerLogin extends State<CustomerLogin> {
  void _deliverPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DeliverLogin()));
  }

  void _frameCustomer() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => FrameCustomer()));
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
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(40, 100, 40, 65),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          child: Text("Sign In"),
                          onPressed: null,
                        ),
                        RaisedButton(
                          child: Text("Sign Up"),
                          onPressed: null,
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
                          controller: myControllerUser,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                          controller: myControllerPass,
                        ),
                        SizedBox(height: 20),
                        Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: SizedBox(
                              height: 20,
                              width: 160,
                              child: IconButton(
                                onPressed: () {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        // Retrieve the text the user has entered by using the
                                        // TextEditingController.
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(myControllerUser.text +
                                                '  ' +
                                                myControllerPass.text),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    child: Text(
                                                      'Back',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    child: Text('Yes',
                                                        style: TextStyle(
                                                            color: Colors.red)),
                                                    onTap: _frameCustomer,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                tooltip: 'Show me the value!',
                                icon: Icon(Icons.arrow_forward),
                              ),
                            )),
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
            child: RaisedButton(
              child: Text('Log In as Deliver'),
              onPressed: _deliverPage,
            ))
      ]),
    );
  }
}
