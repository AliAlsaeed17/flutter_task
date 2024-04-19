import 'package:flutter_task/core/router/app_routes.dart';
import 'package:flutter_task/data/models/product_model.dart';
import 'package:flutter_task/presentation/screens/error_screen.dart';
import 'package:flutter_task/presentation/screens/prodcut_details_screen.dart';
import 'package:flutter_task/presentation/screens/products_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.productsScreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRoutes.productsScreen,
      name: AppRoutes.productsScreen,
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: AppRoutes.prodcutDetailsScreen,
      name: AppRoutes.prodcutDetailsScreen,
      builder: (context, state) {
        final Product product = state.extra as Product;
        return ProductDetailsScreen(product: product);
      },
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error!),
);
