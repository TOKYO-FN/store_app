import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsByCategory {
  final dio = Dio();

  Future<List<ProductModel>> GetAllProductList({
    required String categoryName,
  }) async {
    Response response = await dio.get(
      'https://fakestoreapi.com/products/category/$categoryName',
    );
    if (response.statusCode == 200) {
      var productList = <ProductModel>[];
      for (var item in response.data) {
        productList.add(ProductModel.fromJson(item));
      }
      return productList;
    } else {
      throw Exception(
        'There is a problem with status code ${response.statusCode}',
      );
    }
  }
}
