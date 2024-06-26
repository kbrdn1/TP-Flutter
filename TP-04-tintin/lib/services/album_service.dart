import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/album.dart';

class AlbumService {
  static Future<List<Album>> fetchAlbums() async {
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('data/albums.json');
    List<dynamic> jsonResult = json.decode(data);
    return jsonResult.map((json) => Album.fromJson(json)).toList();
  }
}
