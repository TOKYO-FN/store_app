import 'package:dio/dio.dart';

class AllCatergoriesService {
  var dio = Dio();

  Future<List<dynamic>> getAllCategories() async {
    Response response = await dio.get(
      'https://fakestoreapi.com/products/categories',
    );
    if (response.statusCode == 200) {
      List categoryList = response.data;
      return categoryList;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
