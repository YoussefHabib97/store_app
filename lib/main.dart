import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_products_cubit.dart';
import 'package:store_app/views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.route: (context) => const HomeView(),
      },
      home: BlocProvider(
        create: (context) => GetAllProductsCubit(),
        child: const HomeView(),
      ),
    );
  }
}
