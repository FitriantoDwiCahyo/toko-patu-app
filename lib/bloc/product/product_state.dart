part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductCategoryLoading extends ProductState {}

final class ProductCategorySuccess extends ProductState {
  ProductCategorySuccess(this.data);
  List<Category> data;
}

final class ProductSuccess extends ProductState {
  ProductSuccess(this.product);
  List<ProductModel> product;
}

final class ProductError extends ProductState {
  ProductError(this.message);

  String message;
}
