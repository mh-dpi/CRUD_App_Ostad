
import 'package:crud_app/data/repositories/repository.dart';
import 'package:crud_app/presentation/ui/pages/home_activity.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {

  final Repository api = Repository();
  runApp(MyApp(api: api,));
}

class MyApp extends StatelessWidget {
  final Repository api;
  const MyApp({super.key,required this.api});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CrudBloc(api),
      child: GetMaterialApp(
        home: HomeActivity(),
      ),
    );
  }
}



