import 'package:dio/dio.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  final dio = Dio();

  Future<List<ProductModel>> GetAllProductList() async {
    Response response = await dio.get('https://fakestoreapi.com/products');
    if (response.statusCode == 200) {
      var productList = <ProductModel>[];
      for (var item in response.data) {
        productList.add(ProductModel.fromJson(item));
      }
      return productList;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
