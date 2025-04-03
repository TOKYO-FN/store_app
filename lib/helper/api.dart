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
}
