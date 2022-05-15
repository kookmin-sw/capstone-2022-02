import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class LocationSelect extends StatefulWidget {
  State<LocationSelect> createState () => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState () {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'icon/marker.png'
      ).then((image) {
        setState(() {
          _markers.add (
            Marker (
              markerId: 'id',
              position: LatLng (0, 0),
              anchor: AnchorPoint(0.5, 1),
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
      anchor: AnchorPoint(0.5, 1),
      position: latLng,
    );
    _markers.add (loc);
    final controller = await _controller.future;
    final CameraPosition c = await controller.getCameraPosition();
    controller.moveCamera (CameraUpdate.toCameraPosition(CameraPosition (target: latLng, zoom: c.zoom)));
    setState(() {});

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container (
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration (
              border: Border.all(
                color: Colors.blue,
                width: 4.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center (
              child: Column (
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding (
                    padding: EdgeInsets.all(20),
                    child: Text ('해당 위치가 맞습니까 ' + latLng.toString()),
                  ),
                  const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
                  const Divider(height: 0, color: Colors.black54, thickness: 0.5, indent: 30.0, endIndent: 30.0,),
                  const Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text ('no'),
                        onPressed: () {
                          _markers.remove(loc);
                          Navigator.pop(context);
                          setState(() {});
                        },
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                      ElevatedButton(
                        child: const Text ('yes'),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, latLng);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    ).whenComplete(() {
      _markers.remove(loc);
      setState(() {});
    });
  }
}