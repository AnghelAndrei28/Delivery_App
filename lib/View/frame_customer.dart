import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customer_login_view.dart';

class FrameCustomer extends StatefulWidget{

  _FrameCustomerView createState() => _FrameCustomerView();
}

class _FrameCustomerView  extends State<FrameCustomer>{

  void _customerPage(){
    Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter layout demo'),
        leading: GestureDetector(
          onTap: _customerPage,
          child: Icon(
              Icons.menu
          ),
        ),
      ),
    );
  }

}