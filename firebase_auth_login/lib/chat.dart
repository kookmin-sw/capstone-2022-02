//임시 화면 file
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text("Chat"),
      ),
      body: Text("chat"),
      
    );
  }
}