import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
//query를 이용해 party 정보를 가져와 처리
//party에 반드시 필요한 정보는 위/경도 정보
//party 정보를 저장할 별도의 list를 관리하는 것이 좋다고 생각함
//service의 질을 올리기 위해서는 query를 해당 page를 실행할 때마다 처리하고, page 밖으로 나가면 초기화하는 것이 좋지않을까 싶음(memory차원)

class MapDisplay extends StatefulWidget {

  @override
  State<MapDisplay> createState () => MapDisplayState();
}

class MapDisplayState extends State<MapDisplay> {
  static const MODE_ADD = 0xF1;
  static const MODE_REMOVE = 0xF2;
  static const MODE_NONE = 0xF3;
  int _currentMode = MODE_NONE;
  int _currentIdx = 0;

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      OverlayImage.fromAssetImage(
        assetName: 'icon/marker.png',
      ).then((image) {
        setState(() {
          _markers.add(Marker(
              markerId: 'id',
              position: LatLng(37.563600, 126.962370),
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
              onMarkerTab: _onMarkerTap));
        });
      });
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
            _controlPanel(),
            _naverMap(),
          ],
        ),
      ),
    );
  }

  _controlPanel() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // 추가
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentMode = MODE_ADD),
              child: Container(
                decoration: BoxDecoration(
                    color:
                        _currentMode == MODE_ADD ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '추가',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        _currentMode == MODE_ADD ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // 삭제
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _currentMode = MODE_REMOVE),
              child: Container(
                decoration: BoxDecoration(
                    color: _currentMode == MODE_REMOVE
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  '삭제',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentMode == MODE_REMOVE
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),

          // none
          GestureDetector(
            onTap: () => setState(() => _currentMode = MODE_NONE),
            child: Container(
              decoration: BoxDecoration(
                  color:
                      _currentMode == MODE_NONE ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black)),
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.clear,
                color: _currentMode == MODE_NONE ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
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
    if (_currentMode == MODE_ADD) {
      _markers.add(Marker(
        markerId: DateTime.now().toIso8601String(),
        position: latLng,
        infoWindow: '테스트',
        onMarkerTab: _onMarkerTap,
      ));
      setState(() {});
    }
    setState(() {
      _markers[_currentIdx].captionText ='';
    });
  }

  //marker 버튼을 눌렀을 때
  //이전에 누른 caption 제거
  void _onMarkerTap(Marker? marker, Map<String, int?> iconSize) {
    int pos = _markers.indexWhere((m) => m.markerId == marker?.markerId);
    setState(() {
      _markers[_currentIdx].captionText = '';
      _markers[pos].captionText = '선택됨';
    });
    _currentIdx = pos;
  }
}