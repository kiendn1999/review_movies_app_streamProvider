import 'package:review_movies_app/data_resources/repository/repository.dart';
import 'package:review_movies_app/pages/popular%20screen/popular_view_model.dart';
import 'package:rxdart/rxdart.dart';

class PopularBloc {
  final _repository = Repository();

  final popularSubject=PublishSubject<List<ItemPopular>>();

  fetchAllPopulars () async {
    List<ItemPopular> videoList = await _repository.fetchAllPopular();
    popularSubject.sink.add(videoList);
  }

  Stream<List<ItemPopular>> get allPopular=>popularSubject.stream;

  dispose(){
    popularSubject.close();
  }

}