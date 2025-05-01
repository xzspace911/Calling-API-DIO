import 'package:bloc_state/bussiness_logic/cubit/products_cubit.dart';
import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/presentation/widgets/product_item.dart';
import 'package:bloc_state/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late List<Products> allProducts;

  @override
  void initState() {
    super.initState();
    allProducts = BlocProvider.of<ProductsCubit>(context).getAllProducts();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          allProducts = (state).products;
          return buildLoadedListWidgets();
        } else {
          return showProgressIndicator();
        }
      },
    );
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: XColors.orange,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: XColors.grey,
        child: Column(
          children: [
            buildProductsList(),
          ],
        ),
      ),
    );
  }

  Widget buildProductsList() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        titleTextStyle: TextStyle(
          color: XColors.lemon,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: XColors.primary,
      ),
      body: buildBlocWidget(),
    );
  }
}
