import 'package:firebase_auth_login/party_list.dart';
import 'package:firebase_auth_login/search.dart';
import 'package:flutter/material.dart';

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
              /*Navigator.push(context, MaterialPageRoute<void> (
                builder: (BuildContext context) => SearchPage(),
                fullscreenDialog: true)
              );*/
            },
            splashRadius: 20,
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'personal notification',
            onPressed: () {},
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