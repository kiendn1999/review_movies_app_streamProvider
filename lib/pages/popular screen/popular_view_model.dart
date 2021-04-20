import 'package:flutter/cupertino.dart';

class ItemPopular extends ChangeNotifier{
  int id;
  String original_title;
  String overview;
  String poster_path;
  String backdrop_path;
  double vote_average;
  String release_date;

  ItemPopular(
      {this.id,
      this.original_title,
      this.overview,
      this.poster_path,
      this.vote_average,
      this.backdrop_path,
      this.release_date});

  toJson() {
    return {
      "id": this.id,
      "original_title": this.original_title,
      "overview": this.overview,
      "poster_path": this.poster_path,
      "backdrop_path": this.backdrop_path,
      "vote_average": this.vote_average,
      "release_date": this.release_date
    };
  }

  factory ItemPopular.fromJson(json) {
    return ItemPopular(
        id: json['id'],
        original_title: json['original_title'],
        overview: json['overview'],
        poster_path: json['poster_path'],
        backdrop_path: json['backdrop_path'],
        vote_average: json['vote_average'],
        release_date: json['release_date']);
  }
}

// final List<ItemPopular> listItemPopular = [
//   ItemPopular(
//       original_title: "RAYA và rồng thần cuối cùng",
//       poster_path: "assets/images/Raya.jpg",
//       release_date: "05-T3-2021"),
//   ItemPopular(
//       original_title: "Tom và Jerry: Quậy tung New York",
//       poster_path: "assets/images/tom-and-jerry.jpg",
//       release_date: "26-T2-2021"),
//   ItemPopular(
//       original_title: "Itachi Shinden",
//       poster_path: "assets/images/itachi_shinden.jpg",
//       release_date: "05-T3-2021"),
//   ItemPopular(
//       original_title: "Fear of Rain",
//       poster_path: "assets/images/fear_of_rain.jpg",
//       release_date: "12-T2-2021"),
//   ItemPopular(
//       original_title: "The Last",
//       poster_path: "assets/images/naruto_the_last.jpg",
//       release_date: "19-T8-2021"),
// ];
