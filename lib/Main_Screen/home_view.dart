import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String get viewText {
    String txt = '';
    for (int i = 0; i < 100; i++) {
      txt += "data";
    }
    return txt;
  }

  bool isPressedShowAll = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          //Title
          const Row(
            children: [
              Icon(Icons.favorite),
              SizedBox(
                width: 12,
              ),
              Text("product"),
              Spacer(),
              Text("view product")
            ],
          ),
          const SizedBox(
            height: 24,
          ),

          ///description
          InkWell(
            child: Text(
              viewText,
              maxLines: isPressedShowAll ? null : 2,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
              onTap: () => setState(() => isPressedShowAll = !isPressedShowAll),
              child: isPressedShowAll
                  ? const Text("Hide all")
                  : const Text("Show all")),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 200,
                  color: Colors.amber,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
