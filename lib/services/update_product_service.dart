import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class UpdateProductService {
  var dio = Dio();

  Future<Map<String, dynamic>> updateProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };

    return await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: data,
    );
  }
}
