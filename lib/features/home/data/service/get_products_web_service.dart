import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/app_strings.dart';

class GetProductsWebService {
  late Dio dio;
  GetProductsWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 5),
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getProductsByCategory(String category) async {
    final allCategory = await dio.get("products/category/$category");
    return allCategory.data["products"];
  }
}
