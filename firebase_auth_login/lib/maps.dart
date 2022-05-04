import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'map_display.dart';


class Maps extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text("Map"),
      ),
      body: MapDisplay(),
      
    );
  }
}