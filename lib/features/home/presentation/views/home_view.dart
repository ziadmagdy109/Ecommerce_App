import 'package:ecommerce_app/features/home/presentation/providers/products_provider.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/build_list_categories.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/build_widget_internet_error.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/build_widget_is_empty_data.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);
    final allProductsByCategory = ref.watch(productsProvider(category!));
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 25.h),
          const Flexible(child: BuildListCategories()),
          Row(
            children: [
              SizedBox(width: 10.w),
              Text('This is $category', style: TextStyle(fontSize: 20.sp)),
            ],
          ),
          Flexible(
            flex: 4,
            child: allProductsByCategory.when(
              data: (data) {
                if (data.isEmpty) {
                  return const BuildWidgetIsEmptyData();
                }
                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ProductItem(product: data[index]);
                  },
                );
              },
              error: (error, stackTrace) => const BuildWidgetInternetError(),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
