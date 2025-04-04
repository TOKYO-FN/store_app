import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class AllCatergoriesService {
  var dio = Dio();

  Future<List<dynamic>> getAllCategories() async {
    var jsonData = await Api().get(
      url: 'https://fakestoreapi.com/products/categories',
    );

    return jsonData;
  }
}
