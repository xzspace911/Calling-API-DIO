part of 'products_cubit.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoaded extends ProductsState{
  final List<Products> products;
  ProductsLoaded(this.products);
}

class ProductErrorCase extends ProductsState{
  final String errorMessage;
  ProductErrorCase(this.errorMessage);
}