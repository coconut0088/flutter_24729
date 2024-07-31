import 'package:flutter/material.dart';

class Image1 extends StatefulWidget {
  const Image1({super.key});

  @override
  State<Image1> createState() => _Image1State();
}

class _Image1State extends State<Image1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이미지 앱 바입니다."),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.network(
              'https://flutter.dev/images/flutter-logo-sharing.png')),
    );
  }
}
