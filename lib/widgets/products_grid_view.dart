import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_products_cubit.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/widgets/product_tile.dart';

class ProductsGridView extends StatelessWidget {
  final List<Product> products;
  const ProductsGridView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
      builder: (context, state) {
        if (state is GetAllProductsInitial) {
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey,
              ),
            ),
          );
        }

        if (state is GetAllProductsSuccess || state is GetAllProductsLoading) {
          return GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return ProductTile(
                product: products[index],
              );
            },
          );
        } else {
          return const Center(
            child: AlertDialog(
              title: Text("An error has occured"),
              content: Text("Please try again later"),
            ),
          );
        }
      },
    );
  }
}
