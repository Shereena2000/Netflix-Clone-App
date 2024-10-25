import 'dart:convert';

import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_models.dart';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.themoviedb.org/3/";
var key = "?api_key=$apiKey";
late String endPoint;

class ApiServices {
  Future<UpComingMovieModel> getUpcomingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl$endPoint$key";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return UpComingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception("failed to load upcoming movies");
  }
}
