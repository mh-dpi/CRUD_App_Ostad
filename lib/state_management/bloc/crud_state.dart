part of 'crud_bloc.dart';

sealed class CrudState extends Equatable {
  final List<Product> products;
  final String errorMessages ;
  const CrudState( {required this.products, required this.errorMessages});
}

final class CrudInitialState extends CrudState {
  const CrudInitialState({ super.products=const[], super.errorMessages=""});
  @override
  List<Object> get props => [products,errorMessages];
}


final class CrudErrorState extends CrudState {
  const CrudErrorState({  super.products= const [], required super.errorMessages});
  @override
  List<Object> get props => [products,errorMessages];
}

final class LoadedProductState extends CrudState {
  const LoadedProductState({ required super.products,  super.errorMessages=""});
  @override
  List<Object> get props => [products,errorMessages];
}

final class CrudUpdateState extends CrudState {
  const CrudUpdateState({ required super.products,  super.errorMessages=""});
  @override
  List<Object> get props => [products,errorMessages];
}
