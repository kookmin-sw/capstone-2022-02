import 'package:firebase_auth_login/party_list.dart';
import 'package:firebase_auth_login/search.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'party_init.dart';
//query 추가 필요(database에서 띄울 요소, 일단은 지역기준인데 관심사 기준으로 해도 괜찮을 듯 함)

class Home extends StatefulWidget{
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _party = <PartyList>[];
  final _page = 0; //query추출을 10개씩 하기 때문에 page저장으로 중복하지 않게 할 것
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
      body: _partyListView (),
      floatingActionButton: FloatingActionButton (
        onPressed: (() {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => PartyInit(),
            fullscreenDialog: true,
            )
          );
        }),
        child: const Icon (Icons.add),
      ),
    );
  }

  Widget _partyListView () {
    return ListView.builder (
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();
        final i = index ~/ 2;
        if (index >= _party.length) {      
          for (int j = 0; j < 10; j++) {
            _party.add(
                PartyList (
                title: 'title',
                categori: 'categori',
                date: '2022-00-00',
                maxNumber: 10,
                nowNumber: 3,
                thumbnail: Container (
                  child: Icon (Icons.sports,),
                  color: Colors.grey,
                ),
                description: '', 
              )
            );
          }
        }
        return _party[i];
      }
    );
  }
}