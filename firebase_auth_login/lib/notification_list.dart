import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Column (
        children: <Widget> [
          GestureDetector(
            onTap: () {
              print ('tapped');
            },
            child: Card (
              child: ListTile (
                leading: Icon (Icons.notifications),
                title: Text (
                  'Name'
                ),
                subtitle: Text (
                  'description'
                ),
              )
            )
          )
        ]
      )
    );
  }
}