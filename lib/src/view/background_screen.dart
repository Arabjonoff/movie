
import 'package:flutter/material.dart';
import 'package:movie/src/core/api_response.dart';
import 'package:movie/src/viewmodel/main_viewmodel.dart';
import 'package:provider/provider.dart';

class BackgroundScreen extends StatefulWidget {
  ScrollController controller;
   BackgroundScreen({Key? key,required this.controller}) : super(key: key);

  @override
  State<BackgroundScreen> createState() => _BackgroundScreenState();
}

class _BackgroundScreenState extends State<BackgroundScreen> {
  @override
  initState(){
    Provider.of<MainViewModel>(context ,listen: false).fetPopular();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<MainViewModel>(builder: (context,data,child){
        if(data.response.status == Status.LOADING){
          return CircularProgressIndicator();
        }
        if(data.response.status == Status.SUCCESS){
          return ListView.builder(
              controller: widget.controller,
              scrollDirection: Axis.horizontal,
              itemCount: data.movies.length,
              itemBuilder: (context,index){
                return Image.network('https://image.tmdb.org/t/p/w500/${data.movies[index].posterPath}',);
              });
        }
        if(data.response.status == Status.ERROR){
          return Center(
            child: Text(data.response.message!),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },),
    );
  }
}
