import 'package:delivery_project/View/deliver_login_view.dart';
import 'package:delivery_project/View/frame_customer.dart';
import 'package:delivery_project/View/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomerLogin extends StatefulWidget {
  _CustomerLogin createState() => _CustomerLogin();
}

class _CustomerLogin extends State<CustomerLogin> {
  void _deliverPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => DeliverLogin()));
  }

  void _registerPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerRegister()));
  }

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

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
                          textColor: Colors.white,
                          color: Colors.indigoAccent,
                          splashColor: Colors.white.withOpacity(0.5),
                        ),
                        FlatButton(
                          child: Text("Sign Up"),
                          onPressed: _registerPage,
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
                              labelText: 'Email'),
                          controller: emailTextEditingController,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password'),
                          controller: passwordTextEditingController,
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
                                  if(emailTextEditingController.text.contains("@curierat"))
                                  {
                                    displayToastMessage("You can't connect with deliver account", context);
                                  }
                                  else {
                                    _loginUser();
                                  }
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
            padding: const EdgeInsets.only(bottom: 50),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.indigoAccent,
              splashColor: Colors.white.withOpacity(0.5),
              child: Text('Log In as Deliver'),
              onPressed: _deliverPage,
            ))
      ]),
    );
  }

  Future<void> _loginUser() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailTextEditingController.text,
          password: passwordTextEditingController.text
      );
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
    } catch (e) {
      print("Error: $e");
    }
  }

}

