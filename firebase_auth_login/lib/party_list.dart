import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartyList extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all (Radius.circular(10.0)),
        color: Colors.white,
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
          style: BorderStyle.solid
        ),
        boxShadow: [BoxShadow (
          color: Colors.grey.withOpacity(0.6),
          spreadRadius: 1,
          blurRadius: 3.0,
        )]
      ),
      
      child: Row (
        children: [
          Flexible(
            child: Container (
              child: Icon (Icons.sports_soccer),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration (
                color: Colors.blue[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7.0),
                  bottomLeft: Radius.circular(7.0)
                ),
              ),
            ),
            flex: 2,
          ),
          Flexible (
            child: Container (
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration (
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(7.0),
                  bottomRight: Radius.circular(7.0),
                ),
                color: Colors.blue[300]
              ),
              child: Column (
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration (
                        color: Colors.red[500],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7.0)
                        )
                      ),
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
                      decoration: BoxDecoration (
                        color: Colors.red[500],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(7.0)
                        )
                      ),
                      child: Center (child: Text ("1 / 4"))),
                    flex: 1,
                  )
                ]
              ),
            ),
            flex: 5,
            ),
        ],
      )
    );
  }
}

