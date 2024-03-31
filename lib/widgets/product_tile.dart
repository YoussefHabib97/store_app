import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_products_cubit.dart';
import 'package:store_app/models/product.dart';
import 'package:store_app/views/update_product_view.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const UpdateProductView(),
            ),
          )
              .then((value) {
            BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
          });
        },
        child: Card(
          elevation: 5,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: 85,
                  child: Image.network(
                    product.image,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
