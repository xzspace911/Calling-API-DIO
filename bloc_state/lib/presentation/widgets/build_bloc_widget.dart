import 'package:bloc_state/bussiness_logic/cubit/products_cubit.dart';
import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/presentation/widgets/build_loaded_list_widget.dart';
import 'package:bloc_state/presentation/widgets/show_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BuildBlocWidget extends StatelessWidget {
   BuildBlocWidget({super.key});
  late List<Products> allProducts;
  




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProducts = (state).products;
          return BuildLoadedListWidget();
        } else {
          return ShowProgressIndicator();
        }
      },
    );
  }
}