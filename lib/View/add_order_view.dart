import 'package:delivery_project/View/frame_customer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOrder extends StatefulWidget {
  _AddOrderView createState() => _AddOrderView();
}

class _AddOrderView extends State<AddOrder> {
  void _addOrderPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => FrameCustomer()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFffcd3c),
          centerTitle: true,
          title: Text('Add Order'),
          leading: GestureDetector(
            onTap: _addOrderPage,
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          color: Color(0xFF2e282a),
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            SizedBox(height: 140),
            Container(
              width: 300,
                child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFffcd3c),
                  border: OutlineInputBorder(),
                  labelText: 'Order Code'),
            )),
            SizedBox(height: 40),
            SizedBox(
                height: 30,
                width: 160,
                child: FlatButton(
                    child: Text(
                      'Add Order',
                      textScaleFactor: 1.3,
                    ),
                    textColor: Colors.white,
                    color: Colors.indigoAccent,
                    splashColor: Colors.white.withOpacity(0.5),
                    onPressed: () {})),
          ]),
        ));
  }
}
