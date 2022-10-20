import 'package:flutter/material.dart';
import 'package:movie/src/model/movie.dart';

class PopularWidget extends StatelessWidget {
  final MovieResult movieResult;
  const PopularWidget({Key? key, required this.movieResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 250,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(left: 8,right:8,bottom: 50 ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
              child: Image.network('https://image.tmdb.org/t/p/w500/${movieResult.posterPath}',width: 300,)),
        ),
      ],
    );
  }
}
