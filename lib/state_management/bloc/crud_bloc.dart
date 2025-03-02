import 'package:bloc/bloc.dart';
import 'package:crud_app/data/api/fetch_product.dart';

import 'package:crud_app/data/model/product.dart';
import 'package:equatable/equatable.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final Api api ;
  CrudBloc(this.api) : super(CrudInitialState()) {
    on<AddProductEvent>((event, emit) async {
      try {
        bool isAdded = await api.createProduct(event.product);
        if (isAdded) {
          final List<Product> products = await api.fetchProducts();
          emit(CrudUpdateState(products: products));
        }
      } catch (e) {
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });
    on<LoadProductEvent>((event, emit) async {
      try {
        final List<Product> products = await api.fetchProducts();
        emit(CrudUpdateState(products: products));
      } catch (e) {
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });

    on<UpdateProductEvent>((event, emit) async {
      try {
        bool isAdded = await api.updateProduct(event.product);
        if (isAdded) {
          final List<Product> products = await api.fetchProducts();
          emit(CrudUpdateState(products: products));
        }
      } catch (e) {
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      try {
        bool isAdded = await api.deleteProduct(event.productId);
        if (isAdded) {
          final List<Product> products = await api.fetchProducts();
          emit(CrudUpdateState(products: products));
        }
      } catch (e) {
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });
  }
}
