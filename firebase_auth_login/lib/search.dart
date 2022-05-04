import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//query를 이용한 search 처리 필요

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<String>>? searchResults;
  TextEditingController editingController = TextEditingController();

  @override
  Widget build (BuildContext context) {
    print (searchResults);
    return Scaffold(
      appBar: searchHeader(),
      body: searchResults == null ? displayNoResult() : displayResult(),
    );
  }

  AppBar searchHeader () {
    return AppBar(
      title: TextFormField (
        controller: editingController,
        decoration: InputDecoration (
          hintText: '검색어를 입력하세요.',
          hintStyle: TextStyle (
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder (
            borderSide: BorderSide(color: Colors.white,)
          ),
          focusedBorder: UnderlineInputBorder (
            borderSide: BorderSide(color: Colors.white,)
          ),
          filled: true,
          prefixIcon: Icon (Icons.search, color: Colors.white,),
          suffixIcon: IconButton (
            icon: Icon (Icons.clear, color: Colors.white,),
            onPressed: () {
              editingController.clear ();
            },
          ),
        ),
        style: TextStyle (
          fontSize: 18,
          color: Colors.white,
        ),
        onFieldSubmitted: (str) {
          print (str);
          //query 처리 필요
          Future<List<String>> datas = Future<List<String>>.delayed(Duration(seconds: 2), () => ['Data1', 'Data2', 'Data3']);
          setState(() {
            searchResults = datas;
          });
        },
      )
    );
  }

  displayNoResult () {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container (
      child: Center (
        child: Text (
          'Not Results',
          textAlign: TextAlign.center,
          style: TextStyle (
            fontSize: 40,
          ),
        ),
      ),
    );
  }

  displayResult () {
    return FutureBuilder(
      future: searchResults,
      builder: (context, AsyncSnapshot<List<String>> snapshot) {
        if (!snapshot.hasData) {
          return Center (child: CircularProgressIndicator ());
        }
        List<searchResult> searchDatas = [];
        snapshot.data?.forEach ((element) => searchDatas.add(searchResult(element)));
        return ListView(
          children: searchDatas
        );
      }
    );
  }
}

class searchResult extends StatelessWidget {
  final String data;
  searchResult (this.data);

  @override
  Widget build (BuildContext context) {
    return Padding(
      padding: EdgeInsets.all (3),
      child: Container (
        child: Column (
          children: <Widget> [
            GestureDetector(
              onTap: () {
                print ('tapped');
              },
              child: ListTile (
                leading: Icon (Icons.sports_basketball),
                title: Text (
                  'Party Name'
                ),
                subtitle: Text (
                  'event'
                ),
              )
            )
          ],
        )
      ),
    );
  }
}