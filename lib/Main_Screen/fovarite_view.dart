import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htcproject1/Models/product_item.dart';
import 'package:htcproject1/Widgets/produt_item.dart';

class FovariteView extends StatefulWidget {
  const FovariteView({Key? key}) : super(key: key);

  @override
  State<FovariteView> createState() => _FovariteViewState();
}

class _FovariteViewState extends State<FovariteView> {
  late final PageController controller;
  int? index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller
        .dispose(); /*the page close when i close the page close the controller */
    // TODO: implement dispose
    super.dispose();
  }
  //
  // final List<ProductModul> _products = List.generate(
  //     50,
  //     (index) => ProductModul(
  //         id: index,
  //         name: /*put expended to column to take all big data and there is no thing damage and expanded take all the space*/
  //             "product product product product product product product product product product product product product product product product product product product product product product  ${index + 1}",
  //         price: index + 5.8,
  //         image:
  //             'https://th.bing.com/th/id/OIP.VpgZBoZ0eoMsdSwuNjwZuQHaHa?pid=ImgDet&rs=1'));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                if (index == 0) {
                  controller.animateToPage(2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut);
                } else {
                  controller.previousPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut);
                }
              },
              child: const Text(
                "Previous",
                style: TextStyle(fontFamily: "hip", fontSize: 30),
              ),
            ),
            InkWell(
              onTap: () {
                if (index == 2) {
                  /*if i am in page 3 return me to page 1*/
                  controller.animateToPage(0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut);
                } else {
                  controller.nextPage(
                      /*if i ais in other page and i clicked next it will move from page 1 to 2 to 3 */
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceIn);
                }
              },
              child: const Text("Next", style: TextStyle(fontFamily: "Roboto")),
            )
          ]),
          Expanded(
            /*because the we put PageView in column and there os no space */
            child: PageView(
              // scrollDirection: Axis.vertical,
              controller: controller,
              onPageChanged: (_) {
                index = _;
              },
              children: [
                Container(
                  color: Colors.yellow, //0
                ),
                Container(
                  color: Colors.red, //1
                ),
                Container(
                  color: Colors.blue, //2
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
