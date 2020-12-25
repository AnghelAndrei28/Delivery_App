import 'package:delivery_project/View/customer_login_view.dart';
import 'package:delivery_project/View/frame_customer.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'Bombonika Tha',
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
                      color: Colors.indigoAccent,
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
                      color: Colors.indigoAccent,
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
                      color: Colors.indigoAccent,
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
                      color: Colors.indigoAccent,
                      splashColor: Colors.white.withOpacity(0.5),
                      onPressed: _logInPage,
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
