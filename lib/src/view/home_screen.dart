import 'package:flutter/material.dart';
import 'package:movie/src/core/api_response.dart';
import 'package:movie/src/viewmodel/main_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            itemCount: data.movies.length,
              itemBuilder: (context,index){
                return Text(data.movies[index].title);
          });
        }
        if(data.response.status == Status.ERROR){
          return Center(
            child: Text(data.response.message!),
          );
        }
        return Container(color: Colors.red,);
      },),
    );
  }
}
