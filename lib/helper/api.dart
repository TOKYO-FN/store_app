import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();
  Future<dynamic> get({required String url}) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
        'there is a problem with status code${response.statusCode}',
      );
    }
  }

  Future<dynamic> post({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    Response response = await dio.post(
      url,
      data: body,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception(
        'there is an error with status code ${response.statusCode}',
      );
    }
  }

  Future<dynamic> put({
    required String url,
    required dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Accept': 'application/json',
    };
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    Response response = await dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception(
        'there is an error with status code ${response.statusCode}',
      );
    }
  }
}
