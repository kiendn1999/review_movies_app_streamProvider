import 'package:flutter/cupertino.dart';
import 'package:review_movies_app/data_resources/api_urls.dart';
import 'package:review_movies_app/pages/detail%20screen/item_cast_model.dart';
import 'package:review_movies_app/pages/popular%20screen/popular_view_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:review_movies_app/resources/strings.dart';

class ApiServices {
  Future<List<ItemPopular>> getPopularList() async {
    List<ItemPopular> popularList = [];
    var response = await http.get(ApiUrls().popularListApiUrl);
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List listJson = body['results'];
      for (Map itemJson in listJson) {
        ItemPopular itemPopular = ItemPopular.fromJson(itemJson);
        popularList.add(itemPopular);
      }
    } else
      throw Exception(errorFromApi);
    return popularList;
  }

  getCastList({@required String id}) async {
    List<ItemCast> castList = [];
    var response = await http.get(ApiUrls().castListApiUrl(id: id));
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      List listJson = body['cast'];
      for (Map itemJson in listJson) {
        ItemCast itemCast = ItemCast.fromJson(itemJson);
        castList.add(itemCast);
      }
    }
    else
      throw Exception(errorFromApi);

    return castList;
  }
}
