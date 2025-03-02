part of 'crud_bloc.dart';

sealed class CrudEvent extends Equatable {
  const CrudEvent();
}

final class LoadProductEvent extends CrudEvent {
  @override
  List<Object> get props => [];
}

final class AddProductEvent extends CrudEvent {
  final Product product;

  const AddProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

final class UpdateProductEvent extends CrudEvent {
  final Product product;

  const UpdateProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

final class DeleteProductEvent extends CrudEvent {
  final String productId;

  const DeleteProductEvent({
    required this.productId,
  });

  @override
  List<Object> get props => [productId];
}


final class ViewProductEvent extends CrudEvent {
  final String productId;

  const ViewProductEvent({
    required this.productId,
  });

  @override
  List<Object> get props => [productId];
}