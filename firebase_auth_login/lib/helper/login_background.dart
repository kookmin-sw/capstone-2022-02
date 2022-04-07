import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{

  LoginBackground({required this.isJoin});
  final bool isJoin;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin ? Colors.red : Colors.indigoAccent;//.. 페인트 오브젝트 생성 블루로 그다음 paint 로  넣음
    canvas.drawCircle(Offset(size.width*0.48, size.height*0.2), size.height*0.5, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {//프레임단위로 다시 칠할거임??
    return false;
  }
}