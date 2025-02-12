import 'package:flutter/material.dart';
import 'package:flutter_app/model/album.dart';
import 'package:flutter_app/provider/album_provider.dart';
import 'package:flutter_app/scroleview_page.dart';
import 'package:flutter_app/stack.dart';
import 'package:flutter_app/view/album_provider_view.dart';

import 'Ristview.dart';
import 'alert.dart';
import 'align.dart';
import 'bottom_navigator_bar.dart';
import 'button.dart';
import 'column_row.dart';
import 'form_home_page.dart';
import 'image.dart';
import 'my_first_page.dart';
import 'navigater.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImagePage(),
    );
  }
}

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.first_page),
              title: const Text('My First Page'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFirstPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_column),
              title: const Text('Column Row'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ColumnRowPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.layers),
              title: const Text('Stack'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StackPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Align'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Align1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.warning),
              title: const Text('Alert'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Alert()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Image'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Image1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.smart_button),
              title: const Text('Button'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Button()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.move_up),
              title: const Text('Navigator'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Navigator1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('List View'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListView1()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.data_object),
              title: const Text('Scrollview Pagination'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScrollviewPagination()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.border_bottom),
              title: const Text('Navigator Bar'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigatorBar()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.input),
              title: const Text('Form'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormHomePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.album),
              title: const Text('Albums'), // Label for the new item
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlbumProviderView()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Home Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}