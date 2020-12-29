import 'package:delivery_project/View/customer_login_view.dart';
import 'package:delivery_project/View/deliver_login_view.dart';
import 'package:delivery_project/View/frame_customer.dart';
import 'package:delivery_project/View/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef = FirebaseDatabase.instance.reference().child(
    "users");
DatabaseReference deliversRef = FirebaseDatabase.instance.reference().child(
    "delivers");
DatabaseReference ordersRef = FirebaseDatabase.instance.reference().child(
    "orders");


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          }

          checkDriver(){
          DatabaseReference  db = FirebaseDatabase.instance.reference().child("drivers");
          db.once().then((DataSnapshot snapshot){
            Map<dynamic, dynamic> values = snapshot.value;
            values.forEach((key,values) {
              print(key);
              return key;
            });
          });
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    User user = snapshot.data;

                    if (user == null){
                      return CustomerLogin();
                    } else if(checkDriver() == user.uid) {
                      return DeliverLogin();
                    }else{
                      return FrameCustomer();
                    }
                  }
                  return Scaffold(
                    backgroundColor: Color(0xFFffcd3c),
                    body: Center(
                      child:  CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>
                          (Color(0xFF2e282a)),
                      ),
                    ),
                  );
                }
            );
          }

          return Scaffold(
            backgroundColor: Color(0xFFffcd3c),
            body: Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>
                  (Color(0xFF2e282a)),
              ),
            ),
          );
        }
    );
  }
}

