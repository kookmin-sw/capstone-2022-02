import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MainPage extends StatelessWidget{
  final String email;
  MainPage({required this.email});


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(email),
     ),
     body: Container(
       child: Center(
         child: FlatButton(onPressed: (){
           FirebaseAuth.instance.signOut();

         },
         child: Text("Logut"),
         ),
       )
     ),
     );
  }

}