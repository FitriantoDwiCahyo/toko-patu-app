import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:toko_patu_app/services/product_service.dart';

import '../../models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductService productS = ProductService();
  ProductBloc() : super(ProductInitial()) {
    on<ShowCategoryEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        Map<String, dynamic> data = await productS.categoryProduct();
        if (data['error'] != true) {
          List<Category> category = data['data'];
          // print('Run Category');
          emit(ProductCategorySuccess(category));
        } else {
          String message = data['message'];
          emit(ProductError(message));
        }
      } catch (e) {
        emit(ProductError('$e'));
      }
    });

    on<ShowProductEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        Map<String, dynamic> data = await productS.getProduct();

        if (data['error'] != true) {
          List<ProductModel> product = data['data'];
          emit(ProductSuccess(product));
        } else {
          String message = data['message'];
          emit(ProductError(message));
        }
      } catch (e) {
        emit(ProductError('$e'));
      }
    });
  }
}
