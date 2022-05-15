//임시 화면 file
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Config extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text("Config"),
      ),
      body: ListView (
        children: [
          TextButton.icon (
            onPressed: (){print ('press');},
            icon: Padding (
              padding: EdgeInsets.only(left: 15.0),
              child: Icon (Icons.announcement)
            ),
            label: Padding (
              padding: EdgeInsets.only(left: 5.0),
              child: Text ("공지사항"),
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric (vertical: 12)
            ),
          ),
          Divider (color: Colors.blue, height: 0, indent: 15, endIndent: 20, thickness: 0.5,),
          TextButton.icon (
            onPressed: (){print ('press');},
            icon: Padding (
              padding: EdgeInsets.only(left: 15.0),
              child: Icon (Icons.info_outlined)
            ),
            label: Padding (
              padding: EdgeInsets.only(left: 5.0),
              child: Text ("버전확인"),
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric (vertical: 12)
            ),
          ),
          Divider (color: Colors.blue, height: 0, thickness: 0.5,),
          TextButton.icon (
            onPressed: (){print ('press');},
            icon: Padding (
              padding: EdgeInsets.only(left: 15.0),
              child: Icon (Icons.lock)
            ),
            label: Padding (
              padding: EdgeInsets.only(left: 5.0),
              child: Text ("개인/보안"),
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric (vertical: 12)
            ),
          ),
          Divider (color: Colors.blue, height: 0, indent: 15, endIndent: 20, thickness: 0.5,),
          TextButton.icon (
            onPressed: (){print ('press');},
            icon: Padding (
              padding: EdgeInsets.only(left: 15.0),
              child: Icon (Icons.notifications_outlined)
            ),
            label: Padding (
              padding: EdgeInsets.only(left: 5.0),
              child: Text ("알림"),
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric (vertical: 12)
            ),
          ),
          Divider (color: Colors.blue, height: 0, indent: 15, endIndent: 20, thickness: 0.5,),
          TextButton.icon (
            onPressed: (){print ('press');},
            icon: Padding (
              padding: EdgeInsets.only(left: 15.0),
              child: Icon (Icons.list_alt_outlined)
            ),
            label: Padding (
              padding: EdgeInsets.only(left: 5.0),
              child: Text ("기록 확인"),
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric (vertical: 12)
            ),
          ),
          Divider (color: Colors.blue, height: 0, indent: 15, endIndent: 20, thickness: 0.5,),
          TextButton.icon (
            onPressed: (){print ('press');},
            icon: Padding (
              padding: EdgeInsets.only(left: 15.0),
              child: Icon (Icons.apps)
            ),
            label: Padding (
              padding: EdgeInsets.only(left: 5.0),
              child: Text ("기타"),
            ),
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric (vertical: 12)
            ),
          ),
          Divider (color: Colors.blue, height: 0, indent: 15, endIndent: 20, thickness: 0.5,),
        ],
      )
      
    );
  }
}