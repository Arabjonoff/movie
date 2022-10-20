abstract class BaseService{
  final String apiKey = "?api_key=3d29da4d5f2cb5074dd90979d2235ccd";
  final String baseUrl = "https://api.themoviedb.org/3/movie";

  Future<dynamic> getResponse(String url);
}