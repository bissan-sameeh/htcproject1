import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htcproject1/Main_Screen/fovarite_view.dart';
import 'package:htcproject1/Main_Screen/profile_view.dart';
import 'package:htcproject1/Main_Screen/shopping_cart_view.dart';
import 'package:htcproject1/Screen/login_screen.dart';
import 'package:htcproject1/Screen/personal_profile.dart';

import '../Main_Screen/home_view.dart';
import '../Widgets/my_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> TEST = List.generate(50, (index) => CircleAvatar());
  int selectedItem = 0;
  List<Widget> views = [
    const HomeScreen(),
    const FovariteView(),
    const ShoppingCartView(),
    const ProfileView(),
  ];

  List<BottomNavigationBarItem> get navItems => const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined), label: 'favorite'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
      ];
  final GlobalKey<ScaffoldState> _key =
      GlobalKey(); /*because each widget hae a key associated with them. */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      /*for each widget there is a key and to declare the drawer we must put it in Scaffold widget */
      appBar: AppBar(
        centerTitle: true,
        /*default is false*/
        backgroundColor: Colors.blue[900],
        toolbarHeight: 60,

        leading: IconButton(
          onPressed: () => _key.currentState!.openDrawer(),
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        actions: const [
          Icon(
            Icons.logout,
            color: Colors.white,
          ),
          SizedBox(
            width: 4,
          )
        ],
        elevation: 0,

        // leading: InkWell(
        //     onTap: () {
        //       print("object");
        //     },
        //     child: Icon(Icons.menu, color: Colors.black, size: 30)),
        title: const Text(
          "App Bar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: [
        //any change accure here
        const HomeView(),
        const FovariteView(),
        const ShoppingCartView(),
        const ProfileView(),
      ][selectedItem],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 16,
          unselectedFontSize: 14,
          elevation: 0,
          backgroundColor: Colors.blue.shade50,
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.grey.shade500,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => selectedItem = index),
          currentIndex: selectedItem,
          items: navItems),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[900],
        elevation: 0,
        child: navItems[selectedItem].icon,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue[900]!,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "gmail@gmail.com",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ]),
              const Divider(
                height: 15, //space around line
                //endIndent: , //padding from left
                thickness: 2, //height of the line
              ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: const Text("Settings"),
              //   trailing: const Icon(Icons.arrow_forward_ios),
              //   subtitle: const Text("Your app setting"),
              //   onTap: () {},
              //   contentPadding: EdgeInsets.zero,
              //   iconColor: Colors.blue[900],
              // ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return [
                        myListTile(
                          title: 'Profile',
                          icon: (Icons.perm_identity),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PesonalProfileScreen()));
                          },
                        ),
                        myListTile(
                          title: 'Login',
                          icon: (Icons.login),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                        ),
                        const myListTile(
                          title: 'Settings',
                          subTitle: "Your settings ",
                          icon: (Icons.settings),
                        ),
                        myListTile(
                          title: 'favorite',
                          icon: (Icons.favorite),
                          onTap: () {},
                        ),
                        const myListTile(
                          title: 'privacy policy',
                          icon: (Icons.policy),
                        ),
                        const myListTile(
                          title: 'logout',
                          show: false,
                          icon: (Icons.logout),
                        ),
                      ][index];
                    },
                    separatorBuilder: (context, index) => const Divider(
                          height: 35,
                        ),
                    itemCount: 5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
