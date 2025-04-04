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
    Map<String, dynamic> data = {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    };
    Response response = await dio.post(
      'https://fakestoreapi.com/products',
      data: data,
      options: Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      ),
    );
    print(response);

    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
