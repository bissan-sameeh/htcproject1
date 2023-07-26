import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({Key? key}) : super(key: key);

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final List<String> _text = List.generate(40, (index) => " $index");
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   clipBehavior: Clip.none,
    //   children: [
    //     Container(
    //       color: Colors.purple,
    //       height: 50,
    //       width: 50,
    //     ),
    //     PositionedDirectional(start: 20, top: 20, child: const CircleAvatar()),
    //   ],
    // );
    // return Column(
    //   children: [
    //     Wrap(
    //       spacing: 30,
    //       runSpacing: 10,
    //       children:
    //           _text.map((String text) => Chip(label: Text(text))).toList(),
    //     ),
    //     RichText(
    //         text: const TextSpan(
    //             style: TextStyle(
    //               fontFamily: "hip",
    //               fontWeight: FontWeight.bold,
    //               fontSize: 30,
    //             ),
    //             children: [
    //           TextSpan(text: "MO", style: TextStyle(color: Colors.redAccent)),
    //           TextSpan(
    //               text: "hamm",
    //               style: TextStyle(
    //                   color: Colors.blue,
    //                   decoration: TextDecoration.underline)),
    //           TextSpan(
    //               text: "ed",
    //               style: TextStyle(
    //                   color: Colors.green,
    //                   decoration: TextDecoration.underline))
    //         ]))
    //   ],
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildElevatedButton(text: "press"),
            const SizedBox(
              height: 16,
            ),
            buildElevatedButton(text: "Login"),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton({required String text}) {
    return ElevatedButton(
        onPressed: () async {
          ///
          isLoading
              ? null /*if the if condition is true we con not press on button until the Duration 4 seconds finished */
              : setState(() {
                  isLoading =
                      !isLoading; //isLoading=true if we press again the is loading true , we con not because null value
                });
          await Future.delayed(const Duration(seconds: 4), () {
            setState(() {
              isLoading = false; // we can press again
            });
          });
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.red,
            minimumSize: const Size(double.infinity, 45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(width: 2, color: Colors.black))),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(text, style: const TextStyle(fontSize: 30)));
  }
}
