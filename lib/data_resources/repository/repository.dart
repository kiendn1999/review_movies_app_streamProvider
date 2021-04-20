import 'package:review_movies_app/data_resources/api_services.dart';
import 'package:review_movies_app/pages/popular%20screen/popular_view_model.dart';

class Repository {
  final ApiServices apiServices = ApiServices();

  Future<List<ItemPopular>> fetchAllPopular() => apiServices.getPopularList();
}
