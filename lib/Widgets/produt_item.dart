import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htcproject1/Models/product_item.dart';

class ProductItem extends StatelessWidget {
  final ProductModul product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: .5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name),
                const SizedBox(
                  height: 8,
                ),
                Text("Price ${product.price}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
