import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class LocationSelect extends StatefulWidget {
  State<LocationSelect> createState () => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState () {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'icon/marker.png'
      ).then((image) {
        setState(() {
          _markers.add (
            Marker (
              markerId: 'id',
              position: LatLng (0, 0),
              icon: image
            )
          );
        });
      });
    });
  }

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: null,
      body: NaverMap (
        onMapCreated: _onMapCreated,
        onMapTap: _onMapTab,
        markers: _markers,
      ),
    );
  }

  void _onMapCreated (NaverMapController controller) {
    _controller.complete(controller);
  }

  void _onMapTab (LatLng latLng) async {
    final loc = Marker(
      markerId: latLng.toString(),
      position: latLng,
    );
    _markers.add (loc);
    final controller = await _controller.future;
    controller.moveCamera (CameraUpdate.toCameraPosition(CameraPosition (target: latLng)));
    setState(() {});

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container (
          height: MediaQuery.of(context).size.height * 0.35,
          child: Center (
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding (
                  padding: EdgeInsets.all(20),
                  child: Text ('해당 위치가 맞습니까 ' + latLng.toString()),
                ),
                Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text ('yes'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context, latLng);
                      },
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    ElevatedButton(
                      child: const Text ('no'),
                      onPressed: () {
                        _markers.remove(loc);
                        Navigator.pop(context);
                        setState(() {});
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}