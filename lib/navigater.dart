import 'package:flutter/material.dart';
import 'package:flutter_app/second_view.dart';

class Navigator1 extends StatefulWidget {
  const Navigator1({super.key});

  @override
  State<Navigator1> createState() => _Navigator1State();
}

class _Navigator1State extends State<Navigator1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("네비게이터 화면"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => SecondView())),
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.blue,
            child: Text("Get Started"),
          ),
        ),
      ),
    );
  }
}
