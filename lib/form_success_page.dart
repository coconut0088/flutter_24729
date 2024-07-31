import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  Widget build(BuildContext context) {
    final Map<String, String> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("성공페이지"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Username: ${args['username']}"),
            Text("Email: ${args['email']}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('홈으로 돌아가기'),
            ),
          ],
        ),
      ),
    );
  }
}
