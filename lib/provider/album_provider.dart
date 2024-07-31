

import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

import '../model/album.dart';


class AlbumProvider with ChangeNotifier{
  final List<Album> _albumlist = List.empty(growable: true);

  List<Album> getAlbumList(){
    _fetchAlbums();
    return _albumlist;
  }



  void _fetchAlbums() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    final List<Album> result = jsonDecode(response.body)
        .map<Album>((json) => Album.fromJson(json))
        .toList();
    _albumlist.clear();
    _albumlist.addAll(result);
    notifyListeners();
  }
}