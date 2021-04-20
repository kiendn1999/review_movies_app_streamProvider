import 'package:flutter/cupertino.dart';

class ApiUrls {
  final Uri popularListApiUrl = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN");

  Uri castListApiUrl({@required String id}) => Uri.parse(
      "https://api.themoviedb.org/3/movie/$id/credits?api_key=9bb89316d8693b06d7a84980b29c011f&language=vi-VN");
}
