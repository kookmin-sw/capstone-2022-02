import 'package:flutter/material.dart';

class PartyDetail extends StatelessWidget {
  const PartyDetail ({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.category,
    required this.maxNumber,
    required this.nowNumber,
    required this.date,
    required this.time,
    required this.description,
    required this.id,
    required this.level,
  }): super (key: key);
  final Widget thumbnail;
  final String title;
  final String category;
  final int maxNumber;
  final int nowNumber;
  final String date;
  final String time;
  final String description;
  final String id;
  final String level;

  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text ('party info'),
        actions: <Widget> [
          TextButton (
            onPressed: () {
              //html connection add
              //기존 파티 정보에 등록
              print ('onPress');
            },
            child: Text (
              '참가',
              style: TextStyle (
                color: Colors.white
              ),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(right: 15.0, left: 15),
              primary: Colors.black
            ),
          )
        ],
      ),
      body: Padding (
        padding: const EdgeInsets.all(25.0),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row (
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SizedBox (
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: thumbnail,
                    ),
                  )
                ),
                //Padding(padding: EdgeInsets.symmetric(horizontal: 55.0)),
                Flexible(
                  child: Text (
                    title,
                    style: TextStyle (
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            const Divider(height: 0, color: Colors.black54, thickness: 1.5,),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text (
                  category,
                  style: TextStyle (
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15.0)),
                Text (
                  'Skill Levle: ' + level,
                  style: TextStyle (
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            const Divider(height: 0, color: Colors.black54, thickness: 1.5,),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            Row (
              children: [
                Text (
                  date,
                  style: TextStyle (
                    fontSize: 20,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15.0)),
                Text (
                  time,
                  style: TextStyle (
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            const Divider(height: 0, color: Colors.black54, thickness: 1.5,),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text (
                  nowNumber.toString() + ' / ' + maxNumber.toString(),
                  style: TextStyle (
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: (){
                    print ('press');
                  },
                  child: Text (
                    '인원 목록 보기',
                    style: TextStyle (
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                  style: TextButton.styleFrom (
                    padding: const EdgeInsets.all(5.0),
                    side: BorderSide(width: 1.5, color: Colors.black54),
                    backgroundColor: Colors.black54,
                  ),
                ),
              ],              
            ),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            const Divider(height: 0, color: Colors.black54, thickness: 1.5,),
            const Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
            Text (
              description,
              style: TextStyle (
                fontSize: 16,
              ),
            )
          ]
        ),
      ),
    );
  }
}