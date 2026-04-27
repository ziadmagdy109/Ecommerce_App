import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/Home/Data/model/product.dart';
import 'package:ecommerce_app/features/Home/Presentation/views/details_view.dart';
import 'package:ecommerce_app/features/Home/Presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.homeView,
        builder: (BuildContext context, GoRouterState state) {
          return HomeView();
        },
      ),
      GoRoute(
        path: AppRoutes.detailsView,
        builder: (BuildContext context, GoRouterState state) {
          final product = state.extra as Product;
          return DetailsView(product: product);
        },
      ),
    ],
  );
}
