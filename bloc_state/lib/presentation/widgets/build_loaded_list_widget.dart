import 'package:bloc_state/presentation/widgets/build_product_list_widget.dart';
import 'package:bloc_state/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BuildLoadedListWidget extends StatelessWidget {
  const BuildLoadedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: XColors.grey,
        child: Column(
          children: [
            BuildProductListWidget(),
          ],
        ),
      ),
    );
  }
}