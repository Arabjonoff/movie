import 'dart:convert';
import 'dart:io';

import 'package:movie/src/core/app_exception.dart';
import 'package:movie/src/services/base_service.dart';
import 'package:http/http.dart' as http;

class PopularService extends BaseService {

  dynamic responseJson;
  @override
  Future getResponse(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(baseUrl + url + apiKey));
      responseJson = returnResponse(response);
      print(response.statusCode);
      print(response.body);
    } on SocketException {
      throw Exception('Internet error');
    }
    return responseJson;
  }

   returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 401:
        throw UnauthorizedException(response.statusCode.toString());
      default:
        throw Exception(response.statusCode.toString());
    }
  }
}
