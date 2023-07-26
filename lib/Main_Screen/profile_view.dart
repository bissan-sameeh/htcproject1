import 'package:flutter/material.dart';
import 'package:htcproject1/Models/product_item.dart';

import '../Widgets/gridview_item.dart';
import '../Widgets/produt_item.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<ProductModul> _Products = List.generate(
      2,
      (index) => ProductModul(
          id: index,
          name:
              "product product product product product product product product product product product product product product product product product product product product product product  ${index + 1}",
          price: index * 0.5,
          image:
              "https://th.bing.com/th/id/OIP.VpgZBoZ0eoMsdSwuNjwZuQHaHa?pid=ImgDet&rs=1"));
  bool convert = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              convert
                  ? const Text(
                      "List View",
                      style: TextStyle(fontSize: 18),
                    )
                  : const Text(
                      "Grid View",
                      style: TextStyle(fontSize: 18),
                    ),
              const Spacer(),
              InkWell(
                onTap: () {
                  setState(() {
                    _Products.add(ProductModul(
                        id: 8,
                        name: "name",
                        price: 5 * 8.5,
                        image:
                            "https://th.bing.com/th/id/OIP.VpgZBoZ0eoMsdSwuNjwZuQHaHa?pid=ImgDet&rs=1"));
                  });
                },
                child: const Text(
                  "Add new",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    convert = !convert;
                  });
                },
                child: const Icon(Icons.local_convenience_store_outlined),
              )
            ],
          ),
          convert
              ? ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ProductItem(
                        product: _Products[index],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 12,
                      ),
                  itemCount: _Products.length)
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  /*allow to grid view to take parent size*/
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GridViewItems(
                      productModul: _Products[index],
                    );
                  },
                  itemCount: _Products.length,
                )
        ],
      ),
    );
  }
}
