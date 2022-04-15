import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartyList extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: const EdgeInsets.all(10.0),
      color: Colors.green[200],
      child: Row (
        children: [
          Flexible(
            child: Container (
              child: Icon (Icons.sports_soccer),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.blue[300],
              margin: const EdgeInsets.all(5.0),
            ),
            flex: 4,
          ),
          Flexible (
            child: Container (
              color: Colors.blue[300],
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              child: Column (
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.red[500],
                      child: Center (child: Text ("파티 이름"))),
                    flex: 1,
                    ),
                  Flexible(
                    child: Container (
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.red[500],
                      child: Center (child: Text ("파티 설명"))),
                    flex: 1,
                  ),
                  Flexible(
                    child: Container (
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.red[500],
                      child: Center (child: Text ("운동 종목"))),
                    flex: 1,
                  ),
                  Flexible(
                    child: Container (
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.red[500],
                      child: Center (child: Text ("1 / 4"))),
                    flex: 1,
                  )
                ]
              ),
            ),
            flex: 6,
            ),
        ],
      )
    );
  }
}

