import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> GetAllProductList() async {
    var jsonData = await Api().get(url: 'https://fakestoreapi.com/products');
    var productList = <ProductModel>[];
    for (var item in jsonData) {
      productList.add(ProductModel.fromJson(item));
    }
    return productList;
  }
}
