import 'package:bloc/bloc.dart';

import 'package:crud_app/data/model/product.dart';
import 'package:crud_app/data/repositories/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  final Repository api ;
  CrudBloc(this.api) : super(CrudInitialState()) {
    on<AddProductEvent>((event, emit) async {
      try {
        bool isAdded = await api.createProduct(event.product);
        if (isAdded) {


          final List<Product> products = await api.fetchProducts();
          emit(CrudUpdateState(products: products));
          Get.snackbar(
            'Product Added Successfully',
            'This is product has been added',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
        }else{
          Get.snackbar(
            'Product Added Failed',
            'This is product has not been added',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
        }
      } catch (e) {
        emit(CrudErrorState(errorMessages: e.toString()));
        Get.snackbar(
          'Product Added Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
        );
      }
    });
    on<LoadProductEvent>((event, emit) async {
      try {
        final List<Product> products = await api.fetchProducts();
        emit(CrudUpdateState(products: products));
      } catch (e) {
        Get.snackbar(
          'Product Loaded Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
        );
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });

    on<UpdateProductEvent>((event, emit) async {
      try {
        bool isAdded = await api.updateProduct(event.product);
        if (isAdded) {
          final List<Product> products = await api.fetchProducts();
          emit(CrudUpdateState(products: products));
          Get.snackbar(
            'Product Updated Successfully',
            'This is product has been updated',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
        }
      } catch (e) {
        Get.snackbar(
          'Product Updated Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
        );
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });

    on<DeleteProductEvent>((event, emit) async {
      try {
        bool isAdded = await api.deleteProduct(event.productId);
        if (isAdded) {
          final List<Product> products = await api.fetchProducts();
          emit(CrudUpdateState(products: products));
          Get.snackbar(
            'Product Deleted Successfully',
            'This is product has been deleted',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 5),
          );
        }
      } catch (e) {
        Get.snackbar(
          'Product Deleted Failed',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5),
        );
        emit(CrudErrorState(errorMessages: e.toString()));
      }
    });
  }
}
