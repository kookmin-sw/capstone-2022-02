import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Column (
        children: <Widget> [
          GestureDetector(
            onTap: () {
              print ('tapped');
            },
            child: ListTile (
              leading: Icon (Icons.sports_baseball),
              title: Text (
                'Name'
              ),
              subtitle: Text (
                'description'
              ),
            )
          )
        ]
      )
    );
  }
}