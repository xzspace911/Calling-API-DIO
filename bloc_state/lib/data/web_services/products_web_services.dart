import 'package:bloc_state/utils/constants/strings.dart';
import 'package:dio/dio.dart';

class ProductsWebServices {
  late Dio dio;

  ProductsWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: XStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllProducts() async {
    try {
      Response response = await dio.get('products');
      return response.data;
    } catch (e) {
      print(e.toString()); // ignore: avoid_print
      return [];
    }
  }
}
