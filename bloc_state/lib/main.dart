import 'package:bloc_state/utils/helpers/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EShop(appRouter: AppRouter(),));
}

class EShop extends StatelessWidget {
  final AppRouter appRouter;
  const EShop({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
