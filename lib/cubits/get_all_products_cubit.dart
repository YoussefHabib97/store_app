import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/services/get_all_products.dart';

part 'get_all_products_states.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  Future<List<dynamic>> getAllProducts() async {
    // Show loading indicator
    emit(GetAllProductsLoading());
    try {
      var data = await GetAllProductsService().getAllProducts();
      // Show fetched data
      emit(GetAllProductsSuccess());
      return data;
    } on Exception {
      // Show error message
      emit(GetAllProductsFailure());
      return [];
    }
  }
}
