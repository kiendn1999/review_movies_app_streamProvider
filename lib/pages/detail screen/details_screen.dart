import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:review_movies_app/data_resources/api_services.dart';
import 'package:review_movies_app/pages/detail%20screen/item_cast_model.dart';
import 'package:review_movies_app/pages/popular%20screen/popular_view_model.dart';

class DetailsScreen extends StatelessWidget {
  final ItemPopular itemPopular;

  const DetailsScreen({Key key, @required this.itemPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
              "https://image.tmdb.org/t/p/original${itemPopular.backdrop_path}",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width),
          Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white.withOpacity(0.8),
          ),
          _body(context)
        ],
      ),
    );
  }

  _body(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: [
        SizedBox(
          height: 20,
        ),
        _header(),
        SizedBox(
          height: 20,
        ),
        _cast(),
        SizedBox(
          height: 20,
        ),
        _overview()
      ],
    );
  }

  _header() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                    "https://image.tmdb.org/t/p/w500${itemPopular.poster_path}")),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(itemPopular.original_title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text("Xuất bản:",
                            style: TextStyle(fontSize: 14, fontFamily: 'd')),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(itemPopular.release_date,
                            style: TextStyle(fontSize: 14, fontFamily: 'd')),
                        flex: 4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text("Rating:",
                            style: TextStyle(fontSize: 14, fontFamily: 'd')),
                        flex: 2,
                      ),
                      Expanded(
                        child: Text(
                          itemPopular.vote_average.toString(),
                          style: TextStyle(fontSize: 14, fontFamily: 'd'),
                        ),
                        flex: 4,
                      )
                    ],
                  )
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  _cast() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 200,
              child: FutureBuilder(
                future:
                    ApiServices().getCastList(id: itemPopular.id.toString()),
                builder: (context, snapshot) {
                  if ((snapshot.hasError) || (!snapshot.hasData)) {
                    return Container(
                      child: Text("Loading..."),
                    );
                  }
                  List<ItemCast> castItemList = snapshot.data;
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: castItemList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _itemCast(castItemList[index]);
                      });
                },
              )),
        ],
      ),
    );
  }

  _itemCast(ItemCast itemCast) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 130,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500${itemCast.profile_path}"))),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            /*itemCast.name*/
            itemCast.name,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            itemCast.character,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11),
          )
        ],
      ),
    );
  }

  _overview() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            itemPopular.overview,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
