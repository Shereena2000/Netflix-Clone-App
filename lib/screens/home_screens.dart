import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_models.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/movie_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpComingMovieModel> upcomingFuture;
  ApiServices apiServices = ApiServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          height: 50,
          width: 120,
        ),
        backgroundColor: kBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 27,
              width: 27,
              color: Colors.blue,
            ),
          ),const
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 220,
                child: MovieCardWidget(
                    future: upcomingFuture, headLineText: "Upcoming Movies"))
          ],
        ),
      ),
    );
  }
}
