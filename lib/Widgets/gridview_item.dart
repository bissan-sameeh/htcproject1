import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htcproject1/Models/product_item.dart';

class GridViewItems extends StatelessWidget {
  final ProductModul productModul;
  GridViewItems({
    super.key,
    required this.productModul,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //         padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 0.6),
        borderRadius: BorderRadiusDirectional.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            /*take the space for column until the another children (text ) and the width con not so we use infinity*/
            child: Image.network(
              productModul.image,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModul.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("${productModul.price}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
