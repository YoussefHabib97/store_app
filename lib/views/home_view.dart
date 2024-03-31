import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_products_cubit.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/products_grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  static const String route = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shop"),
      ),
      body: RefreshIndicator(
        onRefresh: BlocProvider.of<GetAllProductsCubit>(context).getAllProducts,
        child: FutureBuilder(
          future:
              BlocProvider.of<GetAllProductsCubit>(context).getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data as List<Product>;
              return ProductsGridView(products: products);
            } else {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
