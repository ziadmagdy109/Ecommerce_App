import 'package:ecommerce_app/features/Home/Data/model/product.dart';
import 'package:ecommerce_app/features/Home/Data/service/get_products_web_service.dart';

class GetProductsRepository {
  final GetProductsWebService getProductsWebService;
  GetProductsRepository({required this.getProductsWebService});

  Future<List<Product>> getProductsByCategory(String category) async {
    final allCategory = await getProductsWebService.getProductsByCategory(
      category,
    );
    return allCategory.map((e) => Product.fromJson(e)).toList();
  }
}
