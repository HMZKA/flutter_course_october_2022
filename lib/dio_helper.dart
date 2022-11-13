import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {"lang": 'en', 'Content-Type': 'application/json'}));
  }

  static Future<Response?> postData(String path, Map<String, dynamic> data,
      {Map<String, dynamic>? query}) async {
    dio?.options.headers = {};
    return await dio?.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response?> getData(String path,
      {Map<String, dynamic>? query}) async {
    return await dio?.get(path, queryParameters: query);
  }
}