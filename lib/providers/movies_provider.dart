// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apikey = '3c49e0186bd164887d80ddebe072dfe1';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';
  int _popularPage = 0;

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint,
        {'api_key': _apikey, '_language': _language, 'page': '$page'});
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final response = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners(); //Esto es para redibujar los widgets
  }

  getPopularMovies() async {
    _popularPage++;

    final response = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(
      response,
    );

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners(); //Esto es para redibujar los widgets
  }
}
