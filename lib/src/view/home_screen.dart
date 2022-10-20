import 'package:flutter/material.dart';
import 'package:movie/src/view/background_screen.dart';
import 'package:movie/src/view/movie_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    movieScrollController.addListener(() {
      backgroundScrollController.jumpTo(
          movieScrollController.offset
      );
    });
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BackgroundScreen(controller: backgroundScrollController),
        ],
      ),
    );
  }
}
