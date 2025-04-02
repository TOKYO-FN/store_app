import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProductService {
  var dio = Dio();

  Future<ProductModel> updateProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> queryParams = {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
    Response response = await dio.put(
      'https://fakestoreapi.com/products',
      queryParameters: queryParams,
    );

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
