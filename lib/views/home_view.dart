import 'package:flutter/material.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/widgets/product_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shop"),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return GetAllProductsService().getAllProducts();
        },
        child: FutureBuilder(
            future: GetAllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              return GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return const ProductTile();
                },
              );
            }),
      ),
    );
  }
}
