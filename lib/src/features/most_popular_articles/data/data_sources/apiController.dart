import 'package:dio/dio.dart';
import 'package:ny_time_articles/src/core/utils/nyApiData.dart';

class ApiController {
  final dio = Dio();

  Future<Response> getData({String apiLink = ''}) async {
    final response = await dio.get(
        apiLink == '' ? (NYApiData.apiLink + NYApiData.nyApiKey) : apiLink);
    return response;
  }
}
