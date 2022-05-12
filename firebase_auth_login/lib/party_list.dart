import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PartyList extends StatelessWidget {
  const PartyList ({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.categori,
    required this.maxNumber,
    required this.nowNumber,
    required this.date,
    required this.description
  }): super (key: key);
  final Widget thumbnail;
  final String title;
  final String description;
  final String categori;
  final int maxNumber;
  final int nowNumber;
  final String date;

  @override
  Widget build (BuildContext context) {
    return GestureDetector (
      onTap: () {
        print ('tab');
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
                    categori: categori,
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
    required this.categori,
    required this.maxNumber,
    required this.nowNumber,
    required this.date,
  }): super (key: key);
  final String title;
  final String categori;
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
                  categori,
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