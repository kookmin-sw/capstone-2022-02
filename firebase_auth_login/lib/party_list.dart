import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'party_detail.dart';

class PartyList extends StatelessWidget {
  const PartyList ({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.category,
    required this.maxNumber,
    required this.nowNumber,
    required this.date,
    required this.description,
    required this.time,
    required this.id,
    required this.level,
    required this.loc,
  }): super (key: key);
  final Widget thumbnail;
  final String title;
  final String description;
  final String category;
  final int maxNumber;
  final int nowNumber;
  final String date;
  final String time;
  final String id;
  final String level;
  final String loc;

  @override
  Widget build (BuildContext context) {
    return GestureDetector (
      onTap: () {
        Navigator.push (
          context,
          MaterialPageRoute(
            builder: (context) => PartyDetail (
              thumbnail: thumbnail,
              title: this.title,
              category: this.category,
              maxNumber: this.maxNumber,
              nowNumber: this.nowNumber,
              date: this.date,
              time: this.time,
              description: this.description,
              id: this.id,
              level: this.level,
              loc: this.loc
            )
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SizedBox (
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row (
            children: <Widget> [
              AspectRatio(
                aspectRatio: 1.0,
                child: thumbnail,
              ),
              Expanded (
                child: Padding (
                  padding: EdgeInsets.only(left: 10.0),
                  child: _PartyDescription (
                    title: title,
                    category: category,
                    date: date,
                    maxNumber: maxNumber,
                    nowNumber: nowNumber,
                  ),
                ),
                flex: 4,
              )
            ],
          )
        )
      )
    );      
  }
}

class _PartyDescription extends StatelessWidget {
  const _PartyDescription ({
    Key? key,
    required this.title ,
    required this.category,
    required this.maxNumber,
    required this.nowNumber,
    required this.date,
  }): super (key: key);
  final String title;
  final String category;
  final int maxNumber;
  final int nowNumber;
  final String date;

  Widget build (BuildContext context) {
    return Container (
      
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Expanded(
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text (
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle (
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 3.0)),
                Text (
                  category,
                  maxLines: 1,
                  style: TextStyle (
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget> [
                Text (
                  date,
                  style: TextStyle (
                    fontSize: 12.0,
                  ),
                ),
                Text (
                  '$nowNumber / $maxNumber',
                  style: TextStyle (
                    fontSize: 12.0,
                  ),
                )
              ],
            )
          )
        ]
      )
    );
  }
}