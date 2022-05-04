import 'dart:async';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class MapDisplay extends StatefulWidget {

  @override
  State<MapDisplay> createState () => MapDisplayState();
}

class MapDisplayState extends State<MapDisplay> {
  final scaffoldKey = GlobalKey<ScaffoldState> ();
  Completer<NaverMapController> controller = Completer();

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: null,
      body: NaverMap (
        onMapCreated: _onMapCreated,
      )
    );
  }

  void _onMapCreated (NaverMapController c) {
    if (controller.isCompleted) controller = Completer();
    controller.complete(c);
  }
}