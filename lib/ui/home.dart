import 'package:flutter/material.dart';
import 'package:mylyreapp/ui/mylyrepage.dart';

class MyLyreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: MyLyrePage()),
    );
  }
}
