import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review_movies_app/blocs/popular_bloc.dart';
import 'package:review_movies_app/data_resources/api_services.dart';

import 'pages/popular screen/popular_view_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final popularBloc= PopularBloc();
  @override
  Widget build(BuildContext context) {
    popularBloc.fetchAllPopulars();
    return StreamProvider(
      create: (context) => popularBloc.allPopular,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Comfortaa',
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Tab bar
          _tabBar(),
          //Tab bar View
          _tabBarView()
        ],
      ),
    );
  }

  _tabBar() {
    return Padding(
      padding: EdgeInsets.only(top: 80, left: 25),
      child: TabBar(
        controller: _tabController,
        labelStyle: TextStyle(
            fontFamily: "Comfortaa", fontSize: 24, fontWeight: FontWeight.bold),
        tabs: [
          Text("Popular"),
          Text("NowPlaying"),
          Text("Up Coming"),
          Text("Top Rate")
        ],
        indicatorColor: Colors.black,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
        labelPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black.withOpacity(0.5),
        isScrollable: true,
      ),
    );
  }

  _tabBarView() {
    return Expanded(
        child: TabBarView(
      controller: _tabController,
      children: [
        PopularView(),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.orange,
        )
      ],
    ));
  }
}
