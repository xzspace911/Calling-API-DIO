import 'package:bloc_state/bussiness_logic/cubit/products_cubit.dart';
import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/presentation/widgets/build_bloc_widget.dart';
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
      body: BuildBlocWidget(),
    );
  }
}
