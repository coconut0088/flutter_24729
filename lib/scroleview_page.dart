import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScrollviewPagination extends StatefulWidget {
  const ScrollviewPagination({super.key});

  @override
  State<ScrollviewPagination> createState() => _ScrollviewPaginationState();
}

class _ScrollviewPaginationState extends State<ScrollviewPagination> {
  final _url = 'https://jsonplaceholder.typicode.com/albums';
  int _page = 1;
  final int _limit = 20;
  bool _hasNextPage = true; // 다음 페이지가 있는지 여부
  bool _isFirstLoadRunning = false; // 첫번째 페이지 로딩중
  bool _isLoadMoreRunning = false; // 다음페이지 로딩중
  List _albumList = [];
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    initLoad();
    _controller = ScrollController()..addListener(_nextLoad);
  }

  void initLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final res =
          await http.get(Uri.parse("$_url?_page=$_page&_limit=$_limit"));
      setState(() {
        _albumList = jsonDecode(res.body);
      });
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _nextLoad() async {
    print("nextLoad");
    if (_hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 100) {
      setState(() {
        _isLoadMoreRunning = true;
      });
      _page += 1;
      try {
        final res =
            await http.get(Uri.parse("$_url?_page=$_page&_limit=$_limit"));
        final List fetchedAlbums = json.decode(res.body);
        if (fetchedAlbums.isNotEmpty) {
          setState(() {
            _albumList.addAll(fetchedAlbums);
          });
        } else {
          // 데이터가 비어있는 경우
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (e) {
        print(e.toString());
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // 페이지 종료 시 종료해 주는 기능
  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_nextLoad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("test title"),
        ),
        body: _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          controller: _controller,
                          itemCount: _albumList.length,
                          itemBuilder: (context, index) => Card(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                child: ListTile(
                                  title:
                                      Text(_albumList[index]["id"].toString()),
                                  subtitle: Text(_albumList[index]["title"]),
                                ),
                              ))),
                  if (_isLoadMoreRunning == true)
                    Container(
                        padding: const EdgeInsets.all(30),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        )),
                  if (_hasNextPage == false)
                    Container(
                        padding: const EdgeInsets.all(20),
                        child: const Center(
                          child: Text("No more data to be fetched",
                              style: TextStyle(color: Colors.white)),
                        ))
                ],
              ));
  }
}
