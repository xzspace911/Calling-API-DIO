import 'package:bloc_state/bussiness_logic/cubit/products_cubit.dart';
import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class BuildProductListWidget extends StatefulWidget {
  const BuildProductListWidget({super.key});

  @override
  State<BuildProductListWidget> createState() => _BuildProductListWidgetState();
}

class _BuildProductListWidgetState extends State<BuildProductListWidget> {
  late List<Products> allProducts;
  
  @override
  void initState() {
    super.initState();
    allProducts = BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allProducts.length,
      itemBuilder: (ctx, index) {
        return ProductItem(product: allProducts[index]);
      },
    );
  }
}
