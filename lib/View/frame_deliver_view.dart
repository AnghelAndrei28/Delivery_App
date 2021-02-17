import 'package:delivery_project/Model/package_model.dart';
import 'package:delivery_project/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';

class FrameDeliver extends StatefulWidget {
  _FrameDeliverView createState() => _FrameDeliverView();
}

class _FrameDeliverView extends State<FrameDeliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFffcd3c),
          centerTitle: true,
          title: Text('Orders'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 300.0,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Material(
                  child: _FoldingCellSimpleDemo(index),
                );
              }, childCount: 4),
            ),
          ],
        ));
  }
}

class _FoldingCellSimpleDemo extends StatefulWidget {
  final int index;

  _FoldingCellSimpleDemo(this.index);

  @override
  __FoldingCellSimpleDemoState createState() => __FoldingCellSimpleDemoState(index);
}

class __FoldingCellSimpleDemoState extends State<_FoldingCellSimpleDemo> {

  final GlobalKey <FormState> formkey = GlobalKey<FormState>();
  int index;

  __FoldingCellSimpleDemoState(this.index);

  Package package;

  List <Package> packageList;

  @override
  void initState(){
    super.initState();
    ordersRef.onChildAdded.listen(_onEntryAdded);
    packageList = [];
    package = Package('', '', 0, '', '', '');
    ordersRef.onChildChanged.listen(_onEntryChanged);
  }

  void _onEntryAdded(Event event) async{
    setState(() {
      Package package = Package('', '', 0, '', '', '');
      packageList.add(package);
      packageList[packageList.indexOf(package)] = Package.fromSnapshot(event.snapshot);
    });
  }

  void _onEntryChanged(Event event) async{
    var oldEntry = packageList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      packageList[packageList.indexOf(oldEntry)] = Package.fromSnapshot(event.snapshot);
    });
  }

  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    dateTime = DateFormat.yMd().format(DateTime.now());
    return Container(
      color: Color(0xFF2e282a),
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell.create(
        key: _foldingCellKey,
        frontWidget: _buildFrontWidget(packageList.elementAt(index)),
        innerWidget: _buildInnerWidget(packageList.elementAt(index)),
        cellSize: Size(MediaQuery.of(context).size.width, 140),
        padding: EdgeInsets.all(15),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('cell opened'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Widget _buildFrontWidget(Package package) {
    Widget frontDetails = Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFrontDetails('Code :', 'Status :'),
              _buildFrontDetails(package.code, package.status),
            ],
          ),
        ],
      ),
    );

    return Container(
        color: Color(0xFFffcd3c),
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: frontDetails,
              ),
              SizedBox(height: 20),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () =>
                        _foldingCellKey?.currentState?.toggleFold(),
                    child: Text(
                      "OPEN",
                    ),
                    textColor: Colors.white,
                    color: Colors.indigoAccent,
                    splashColor: Colors.white.withOpacity(0.5),
                  ),
                ],
              ))
            ],
          ),
        ));
  }

  Widget _buildInnerWidget(Package package) {
    bool _status;

    if(package.status == "Activ")
      _status = true;
    else
      _status = false;

    Widget innerDetails = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInnerDetails('Hour :', 'Adresa :', 'Phone :'),
          _buildInnerClockDetails(
              package.adress, package.phone),
        ],
      ),
    );

    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            child: Text('Delivery Details'),
          ),
          SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: innerDetails,
          ),
          SizedBox(height: 50),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                child: Text("Finish"),
                onPressed: _status ? () {} : null,
                textColor: Colors.white,
                color: Colors.indigoAccent,
                splashColor: Colors.white.withOpacity(0.5),
              ),
              FlatButton(
                onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                child: Text(
                  "Close",
                ),
                textColor: Colors.white,
                color: Colors.indigoAccent,
                splashColor: Colors.white.withOpacity(0.5),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Column _buildFrontDetails(String labelCode, String labelStatus) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            labelCode,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            labelStatus,
            style: TextStyle(
              color: getColor(labelStatus),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildInnerDetails(
      String labelClock, String labelAdress, String labelPhone) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 28),
        Container(
          margin: const EdgeInsets.only(top: 3),
          child: Text(
            labelClock,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 4),
        Container(
          margin: const EdgeInsets.only(top: 3),
          child: Text(
            labelAdress,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            labelPhone,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildInnerClockDetails(String labelAdress, String labelPhone) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            _selectTime(context);
          },
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: 100,
            height: 20,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(border: Border.all()),
            child: TextFormField(
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              onSaved: (String val) {
                _setTime = val;
              },
              enabled: false,
              keyboardType: TextInputType.text,
              controller: _timeController,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          child: Text(
            labelAdress,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            labelPhone,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  getColor(String labelStatus) {
    if(labelStatus == "Activ") return Colors.green;
    if(labelStatus == "Delivered") return Colors.red;
    return Colors.black;
  }
}
