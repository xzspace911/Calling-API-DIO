import 'package:bloc_state/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowProgressIndicator extends StatelessWidget {
  const ShowProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: XColors.orange,
      ),
    );
  }
}