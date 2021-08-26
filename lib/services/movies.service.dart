import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:login_page_study/models/movie.model.dart';

final String urlNowPlaying = 'https://api.themoviedb.org/3/movie/now_playing?api_key=07d44d3b60444ee3d6cba5ae92062a07&language=en-US&page=1';
var list = [];

class MoviesService {

  Future<List<dynamic>> fetchNowPlaying() async {
    try {
      var response = await http.get(Uri.parse(urlNowPlaying));

      var json = jsonDecode(response.body);
      final jsonResults = json['results'];

      for (var item in jsonResults) {
        var movie = Movie.fromJson(item);
        list.add(movie);
      }

      return list;
    }
    catch(e) {
      throw Exception('Error getting NowPlaying');
    }
  }
}