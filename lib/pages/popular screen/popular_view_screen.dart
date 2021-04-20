import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_movies_app/data_resources/api_services.dart';
import 'package:review_movies_app/pages/detail%20screen/details_screen.dart';
import 'package:review_movies_app/pages/popular%20screen/popular_view_model.dart';

class PopularView extends StatefulWidget {
  @override
  _PopularViewState createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  @override
  Widget build(BuildContext context) {
    var popularList = Provider.of<List<ItemPopular>>(context);
    return Container(
        child: popularList != null
            ? GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.62,
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 30),
                itemCount: popularList.length,
                itemBuilder: (context, index) {
                  return _itemPopular(popularList[index]);
                })
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  _itemPopular(ItemPopular itemPopular) {
    return InkWell(
      onTap: () {
        Route route = MaterialPageRoute(
            builder: (context) => DetailsScreen(
                  itemPopular: itemPopular,
                ));
        Navigator.push(context, route);
      },
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment(0.7, 0.95),
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500${itemPopular.poster_path}"))),
                  ),
                  Text(itemPopular.release_date,
                      style: TextStyle(color: Colors.white))
                ],
              )),
          Expanded(
              flex: 1,
              child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    itemPopular.original_title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
