import 'package:delivery_project/View/customer_login_view.dart';
import 'package:delivery_project/View/frame_customer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_order_view.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageView createState() => _SettingsPageView();
}

class _SettingsPageView extends State<SettingsPage> {
  void _customerFrame() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => FrameCustomer()));
  }

  void _logInPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerLogin()));
  }

  void _addOrderPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => AddOrder()));
  }

   FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    await auth.signOut();
  }

  getUsername(){
    final User user = auth.currentUser;
    final uid = user.uid;

    DatabaseReference  db = FirebaseDatabase.instance.reference().child("users");
    db.once().then((DataSnapshot snapshot){
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        if(key == uid) {
          print (values["username"]);
          return values["username"];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffcd3c),
        centerTitle: true,
        title: Text('Settings'),
        leading: GestureDetector(
          onTap: _customerFrame,
          child: Icon(Icons.menu),
        ),
      ),
      body: Container(
        color: Color(0xFF2e282a),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'Ana',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 130),
            Container(
                child: Column(
              children: [
                SizedBox(
                    height: 50,
                    width: 260,
                    child: FlatButton(
                      child: Text(
                        'Add Order',
                        textScaleFactor: 1.3,
                      ),
                      textColor: Colors.white,
                      color: Color(0xFFffcd3c),
                      splashColor: Colors.white.withOpacity(0.5),
                      onPressed: _addOrderPage
                    )),
                SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: 260,
                    child: FlatButton(
                      child: Text(
                        'Dark',
                        textScaleFactor: 1.3,
                      ),
                      textColor: Colors.white,
                      color: Color(0xFFffcd3c),
                      splashColor: Colors.white.withOpacity(0.5),
                      onPressed: () {},
                    )),
                SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: 260,
                    child: FlatButton(
                      child: Text(
                        'Support',
                        textScaleFactor: 1.3,
                      ),
                      textColor: Colors.white,
                      color: Color(0xFFffcd3c),
                      splashColor: Colors.white.withOpacity(0.5),
                      onPressed: () {},
                    )),
                SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: 260,
                    child: FlatButton(
                      child: Text(
                        'Log Out',
                        textScaleFactor: 1.3,
                      ),
                      textColor: Colors.white,
                      color: Color(0xFFffcd3c),
                      splashColor: Colors.white.withOpacity(0.5),
                      onPressed: () {
                        signOut();
                        Navigator.of(context).pop();
                      },
                    )),
                SizedBox(height: 4),
              ],
            ))
          ],
        ),
      ),
    );
  }




}
