import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htcproject1/Screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        /*when got out from the program , it will go to outside whole program */
        return const HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              //print("hello");
            },
            child: const Icon(
              Icons.cake_outlined,
              size: 56,
              color: Colors.green,
            )),
      ),
    );
  }
}
