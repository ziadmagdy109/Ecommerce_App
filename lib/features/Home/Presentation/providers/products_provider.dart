import 'package:ecommerce_app/core/constants/app_strings.dart';
import 'package:ecommerce_app/features/Home/Data/model/product.dart';
import 'package:ecommerce_app/features/Home/Data/repo/get_products_repository.dart';
import 'package:ecommerce_app/features/Home/Data/service/get_products_web_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsRepoProvider = Provider<GetProductsRepository>(
  (ref) =>
      GetProductsRepository(getProductsWebService: GetProductsWebService()),
);

final selectedCategoryProvider = StateProvider<String?>(
  (ref) => AppStrings.categories.first,
);

final productsProvider = FutureProvider.family<List<Product>, String>((
  ref,
  category,
) async {
  final repo = ref.read(productsRepoProvider);
  return repo.getProductsByCategory(category);
});
