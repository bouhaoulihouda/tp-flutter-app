import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFD0A2F7),
      ),
      body: Center(
        child: Text('Profile Page', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }
}
