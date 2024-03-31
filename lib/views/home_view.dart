import 'package:flutter/material.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/views/update_product_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String route = 'home';

  @override
  Widget build(BuildContext context) {
    GetAllProductsService().getAllProducts();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shop"),
      ),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UpdateProductView(),
                  ),
                );
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
                          'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                        ),
                      ),
                      Column(
                        children: [
                          const Text("Product Title"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "\$249.99",
                                  style: TextStyle(color: Colors.grey),
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
        },
      ),
    );
  }
}
