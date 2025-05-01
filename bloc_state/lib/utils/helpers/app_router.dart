import 'package:bloc_state/bussiness_logic/cubit/products_cubit.dart';
import 'package:bloc_state/data/repo/products_repo.dart';
import 'package:bloc_state/data/web_services/products_web_services.dart';
import 'package:bloc_state/presentation/screens/products_details_screen.dart';
import 'package:bloc_state/presentation/screens/home_screen.dart';
import 'package:bloc_state/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late ProductsRepo productsRepo;
  late ProductsCubit productsCubit;
  AppRouter() {
    productsRepo = ProductsRepo(ProductsWebServices());
    productsCubit = ProductsCubit(productsRepo);
  }

  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XStrings.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => productsCubit,
            child: HomeScreen(),
          ),
        );
      //------------------------------------------------------------------------------
      case XStrings.productsDetailsScreen:
        return MaterialPageRoute(builder: (_) => ProductsDetailsScreen());
    }
  }
}
