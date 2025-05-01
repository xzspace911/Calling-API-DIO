import 'package:bloc_state/data/model/products_model.dart';
import 'package:bloc_state/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: XColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            product.title,
            style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: XColors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis, // if the name is tall 
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: XColors.white,
          child: product.image.isNotEmpty == true
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  placeholderFit: BoxFit.contain,
                  image: product.image,
                  fit: BoxFit.contain,
                )
              : Image.asset("assets/images/placeholder.png"),
        ),
      ),
    );
  }
}
