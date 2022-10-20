import 'package:flutter/material.dart';
import 'package:movie/src/core/api_response.dart';
import 'package:movie/src/viewmodel/main_viewmodel.dart';
import 'package:movie/src/widgets/popular/popular_widget.dart';
import 'package:provider/provider.dart';

class MovieScreen extends StatefulWidget {
   MovieScreen({Key? key,}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  initState(){
    Provider.of<MainViewModel>(context ,listen: false).fetPopular();
    super.initState();
  }
  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;
  PageController backgroundScrollController = PageController();
  PageController movieScrollController = PageController();
  @override
  Widget build(BuildContext context) {
    movieScrollController.addListener(() {
      backgroundScrollController.jumpTo(
          movieScrollController.offset
      );
    });
    return Scaffold(
      body: Stack(
        children: [
         SizedBox(
           child:  Consumer<MainViewModel>(builder: (context,data,child){
             if(data.response.status == Status.LOADING){
               return CircularProgressIndicator();
             }
             if(data.response.status == Status.SUCCESS){
               return PageView.builder(
                 controller: backgroundScrollController,
                   scrollDirection: Axis.horizontal,
                   itemCount: data.movies.length,
                   itemBuilder: (context,index){
                     return  Container(
                       width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height,
                         child: Image.network('https://image.tmdb.org/t/p/w500/${data.movies[index].posterPath}',fit: BoxFit.cover,));
                   });
             }
             if(data.response.status == Status.ERROR){
               return Center(
                 child: Text(data.response.message!),
               );
             }
             return const Center(child: CircularProgressIndicator());
           },),
         ),
          Consumer<MainViewModel>(builder: (context,data,child){
            if(data.response.status == Status.LOADING){
              return CircularProgressIndicator();
            }
            if(data.response.status == Status.SUCCESS){
              return Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: PageView.builder(
                      controller: movieScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: data.movies.length,
                      itemBuilder: (context,index){
                        return PopularWidget(movieResult:data.movies[index],);
                      }),
                ),
              );
            }
            if(data.response.status == Status.ERROR){
              return Center(
                child: Text(data.response.message!),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },),
        ],
      ),
    );
  }
}
