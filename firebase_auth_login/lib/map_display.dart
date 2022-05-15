import 'dart:async';
import 'package:firebase_auth_login/party_detail.dart';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
//query를 이용해 party 정보를 가져와 처리
//party에 반드시 필요한 정보는 위/경도 정보
//party 정보를 저장할 별도의 list를 관리하는 것이 좋다고 생각함
//service의 질을 올리기 위해서는 query를 해당 page를 실행할 때마다 처리하고, page 밖으로 나가면 초기화하는 것이 좋지않을까 싶음(memory차원)

class MapDisplay extends StatefulWidget {

  @override
  State<MapDisplay> createState () => MapDisplayState();
}

class MapDisplayState extends State<MapDisplay> {
  int _currentIdx = -1;

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];
  Map<String, _MarkerDescription> _descripts = Map<String, _MarkerDescription> ();
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'icon/marker.png',
      ).then((image) {
        setState(() {
          _markers.add(
            Marker(
              markerId: 'id',
              position: LatLng(0, 0),
              captionText: "커스텀 아이콘",
              captionColor:  Color.fromARGB(255, 71, 81, 139),
              captionTextSize: 20.0,
              alpha: 0.8,
              captionOffset: 30,
              icon: image,
              anchor: AnchorPoint(0.5, 1),
              width: 45,
              height: 45,
              infoWindow: '인포 윈도우',
              onMarkerTab: _onMarkerTap
              )
            );
        });
      });
    });
    for (int i = 0; i < 5; i++) {
      _descripts[i.toString()] = _MarkerDescription(
        id: i.toString(), 
        title: "name" + i.toString(), 
        category: "one", 
        level: "3",
        loc: LatLng (37.5666805 + (i * 0.001 * (i % 2 == 0 ? 1 : 0)), 126.9784147 + (i * 0.001 * (i % 2 == 1 ? 1 : 0))),
        time: '00:00',
        maxNumber: 10,
        nowNumber: 3,
        thumbnail: Container (
          child: Icon (Icons.sports,),
          color: Colors.grey,
        ),
        description: 'description',
        date: '2022-00-00',
      );
    }
    _descripts.forEach((key, value) {
      _markers.add (
        Marker (
          markerId: key,
          position: value.loc,
          onMarkerTab: _onMarkerTap,
          anchor: AnchorPoint(0.5, 1)
        )
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Column(
          children: <Widget>[
            _naverMap(),
          ],
        ),
      ),
    );
  }

  _naverMap() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          NaverMap(
            onMapCreated: _onMapCreated,
            onMapTap: _onMapTap,
            markers: _markers,
            initLocationTrackingMode: LocationTrackingMode.None,
            locationButtonEnable: true,
          ),
        ],
      ),
    );
  }

  // ================== method ==========================

  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
  }

  //map을 눌렀을 때
  //현재는 캡션을 지우는 방식만 적용
  void _onMapTap(LatLng latLng) {
    if (_currentIdx == -1) {return;}
    setState(() {
      _markers[_currentIdx].captionText ='';
    });
  }

  //marker 버튼을 눌렀을 때
  //이전에 누른 caption 제거
  void _onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    print ('marker tab');
    int _pos = _markers.indexWhere((m) => m.markerId == marker?.markerId);
    setState(() {
      if (_currentIdx != -1) {
        _markers[_currentIdx].captionText = '';
      }
      _markers[_pos].captionText = '선택됨';
    });
    _currentIdx = _pos;
    String _id = _markers[_currentIdx].markerId;
    late _MarkerDescription _d;
    if (_descripts.containsKey(_id)) {
      _d = _descripts[_id]!;
    }

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
                    child: Text (_d.title + ' 상세 정보를 확인하시겠습니까'),
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
                          Navigator.pop(context);
                        },
                      ),
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                      ElevatedButton(
                        child: const Text ('yes'),
                        onPressed: () {
                          Navigator.pop (context);
                          Navigator.push (
                            context,
                            MaterialPageRoute(
                              builder: (context) => PartyDetail(
                                thumbnail: _d.thumbnail,
                                title: _d.title,
                                category: _d.category,
                                maxNumber: _d.maxNumber,
                                nowNumber: _d.nowNumber,
                                date: _d.date,
                                time: _d.time,
                                description: _d.description,
                                id: _d.id,
                                level: _d.level,
                                loc: _d.loc.toString(),
                              ),
                            ),
                          );
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
      _markers[_currentIdx].captionText = '';
      setState(() {});
    });
  }
}

class _MarkerDescription  {
  _MarkerDescription ({
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
    required this.loc,
  });
  final String id;
  final Widget thumbnail;
  final int maxNumber;
  final int nowNumber;
  final String caption = "선택됨";
  final String title;
  final String category;
  final String level;
  final LatLng loc;
  final String date;
  final String time;
  final String description;
}