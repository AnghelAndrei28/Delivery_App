import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';


class FrameDeliver extends StatefulWidget {
  _FrameDeliverView createState() => _FrameDeliverView();
}

class _FrameDeliverView extends State<FrameDeliver> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  child: FoldingCellSimpleDemo(),
                );
              }, childCount: 4),
            ),
          ],
        ));
  }
}

class FoldingCellSimpleDemo extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2e282a),
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell.create(
        key: _foldingCellKey,
        frontWidget: _buildFrontWidget(),
        innerWidget: _buildInnerWidget(),
        cellSize: Size(MediaQuery.of(context).size.width, 140),
        padding: EdgeInsets.all(15),
        animationDuration: Duration(milliseconds: 300),
        borderRadius: 10,
        onOpen: () => print('cell opened'),
        onClose: () => print('cell closed'),
      ),
    );
  }

  Widget _buildFrontWidget() {
    Widget frontDetails = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildFrontDetails('Code :', 'Status :'),
          _buildFrontDetails('RB35536346378', 'Active'),
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
              SizedBox(height: 30),
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

  Widget _buildInnerWidget() {
    Widget innerDetails = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInnerDetails('Ora :', 'Adresa :', 'Phone'),
          _buildInnerDetails('10:40', 'Str. Muresului, Nr. 10, Bl. O1, Ap. 33', '07847589406'),
        ],
      ),
    );

    return Container(
      color: Color(0xFFecf2f9),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            child: Text('Delivery Details'),
          ),
          SizedBox(height: 35),
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
                  FlatButton(
                    child: Text("Finish"),
                    onPressed: () {},
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
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
  Column _buildInnerDetails(String labelHour, String labelAdress, String labelPhone) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: FlatButton(
          child: Text(
            labelHour,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
            onPressed: () {},
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
}
