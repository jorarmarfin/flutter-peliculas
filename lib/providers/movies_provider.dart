// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as json;

import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  final String _apikey = '3c49e0186bd164887d80ddebe072dfe1';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  // Await the http get response, then decode the json-formatted response.

  MoviesProvider() {
    print('inicializado');
    getOnDisplayMovies();
  }
  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, '_language': _language, 'page': '1'});
    final response = await http.get(url);
    final Map<String, dynamic> decodeData =
        json.jsonDecode(response.body) as Map<String, dynamic>;

    print(decodeData);
  }
}
