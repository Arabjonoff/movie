import 'package:flutter/material.dart';
import 'package:movie/src/core/api_response.dart';
import 'package:movie/src/model/movie.dart';
import 'package:movie/src/repository/popular_repository.dart';
class MainViewModel extends ChangeNotifier{

  ApiResponse _apiResponse = ApiResponse.initial('inital');

  List<MovieResult> _movies = [];

  List<MovieResult> get movies  {
    return _movies;
  }

  ApiResponse get response {
    return _apiResponse;
}
  Future fetPopular()async{
    try{
      List<MovieResult> movies = await PopularRepository().fetchPopular();
      _movies = movies;
      _apiResponse = ApiResponse.success(movies);
    }catch(e){
      _apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}