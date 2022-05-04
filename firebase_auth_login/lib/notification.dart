import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notification_list.dart';
//query추가 필요(database에서 알림사항 받아오기)

class NotificationPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text ('Notification'),
      ),
      body: ListView (
        children: <Widget> [
          NotificationList(),
          NotificationList(),
          NotificationList(),
          NotificationList(),
          NotificationList(),
          NotificationList(),
        ]
      )
    );
  }
}