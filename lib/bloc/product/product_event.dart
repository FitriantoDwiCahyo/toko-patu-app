part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ShowCategoryEvent extends ProductEvent {}

class ShowProductEvent extends ProductEvent {}
