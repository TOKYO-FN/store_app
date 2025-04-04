import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsByCategory {
  final dio = Dio();

  Future<List<ProductModel>> GetAllProductList({
    required String categoryName,
  }) async {
    var jsonData = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );
    var productList = <ProductModel>[];
    for (var item in jsonData) {
      productList.add(ProductModel.fromJson(item));
    }
    return productList;
  }
}
