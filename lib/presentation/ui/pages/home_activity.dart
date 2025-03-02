import 'package:crud_app/presentation/ui/pages/add_product.dart';
import 'package:crud_app/presentation/ui/widgets/CustomAppBar.dart';
import 'package:crud_app/presentation/ui/widgets/product_card.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CrudBloc>().add(LoadProductEvent());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: customAppBar("Products"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProduct());
        },
        backgroundColor: Colors.blueAccent,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          if (state is CrudInitialState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            );
          } else if (state is CrudErrorState) {
            return Center(
              child: Text(
                state.errorMessages,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else if (state is LoadedProductState || state is CrudUpdateState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductCard(
                      index: index,
                      id: state.products[index].id,
                      name: state.products[index].ProductName,
                      code: state.products[index].ProductCode.toInt(),
                      price: state.products[index].TotalPrice.toString(),
                      qty: state.products[index].Qty.toString(),
                      unit: state.products[index].UnitPrice.toString(),
                      total: state.products[index].TotalPrice.toString(),
                      image: state.products[index].Img,
                    ),
                  );
                },
                itemCount: state.products.length,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            );
          }
        },
      ),
    );
  }
}

