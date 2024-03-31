import 'package:store_app/constants.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product.dart';

class GetAllProductsService {
  Future<List<dynamic>> getAllProducts() async {
    var data = await Api().get(url: '$kBaseUrl/products');

    List<Product> productsList = [];

    for (var product in data) {
      productsList.add(Product.fromJson(product));
    }

    List<Product> returnedProductsList = [...productsList];

    return returnedProductsList;
  }
}
