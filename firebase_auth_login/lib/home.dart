import 'package:firebase_auth_login/party_list.dart';
import 'package:firebase_auth_login/search.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
//query 추가 필요(database에서 띄울 요소, 일단은 지역기준인데 관심사 기준으로 해도 괜찮을 듯 함,로 따오기)

class Home extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text ("Location"),
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'party search',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void> (
                builder: (BuildContext context) => SearchPage(),
                fullscreenDialog: true
                )
              );
            },
            splashRadius: 20,
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'personal notification',
            onPressed: () {
              Navigator.push (context, MaterialPageRoute<void> (
                builder: (BuildContext context) => NotificationPage(),
                fullscreenDialog: true
                )
              );
            },
            splashRadius: 20,
          )
        ],
      ),
      body: ListView (
        children: [
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
          PartyList(),
        ],
      ),
    );
  }
}