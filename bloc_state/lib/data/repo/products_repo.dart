import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/data/web_services/products_web_services.dart';

class ProductsRepo {
  final ProductsWebServices productsWebServices;

  ProductsRepo(this.productsWebServices);

  Future<List<Products>> getAllProducts() async{
    final products = await productsWebServices.getAllProducts();
    return products.map((product)=> Products.fromJson(product)).toList();
  }
}