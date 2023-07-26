import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PesonalProfileScreen extends StatefulWidget {
  const PesonalProfileScreen({Key? key}) : super(key: key);

  @override
  State<PesonalProfileScreen> createState() => _PesonalProfileScreenState();
}

class _PesonalProfileScreenState extends State<PesonalProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 340,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(70)),
                  image: const DecorationImage(
                    image: AssetImage("Images/img.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Jocob Reborts",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Photographey Work experiance 7 Years.",
                style: TextStyle(fontSize: 16, color: Colors.grey[300]),
              ),
              Text(
                "I make nature and product photography.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              ///Work

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Row(
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "112",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: -3,
                              fontSize: 24),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("works ", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[300]!, width: 5),
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1687223739521-ac0f6e4fb28b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[300]!, width: 5),
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1687223739521-ac0f6e4fb28b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 70,
                          height: 70,
                          margin: const EdgeInsets.only(right: 60),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[300]!, width: 5),
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1687223739521-ac0f6e4fb28b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),

              ///skills and works hours
              Row(
                children: [
                  _buildSmallContainer(
                      color: const Color(0xff002f6c),
                      title: '3',
                      isWhite: true,
                      subTitle: 'applications'),
                  const SizedBox(
                    width: 12,
                  ),
                  _buildSmallContainer(
                      color: Colors.grey[200]!,
                      title: '25',
                      isWhite: false,
                      subTitle: 'View today'),
                ],
              ),

              ///Navigation bar
              _buildNavigationBar,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _buildNavigationBar {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 24),
        /*we does not use horizontal becouse it will take it from spacebetween  */
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(38),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIcon(icon: Icons.perm_identity, index: 0),
            _buildIcon(icon: Icons.search, index: 1),
            _buildIcon(icon: Icons.settings, index: 2),
          ],
        ));
  }

  int _selectedIndex = 0;

  Widget _buildIcon({required IconData icon, required int index}) {
    return InkWell(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        children: [
          Icon(
            icon,
            color:
                _selectedIndex == index ? const Color(0xff002f6c) : Colors.grey,
            size: 40,
          ),
          _selectedIndex == index
              ? const Icon(Icons.circle, color: Color(0xff002f6c), size: 10)
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget _buildSmallContainer(
      {required Color color,
      required bool isWhite,
      required String title,
      required String subTitle}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: isWhite == true ? Colors.white : Colors.black),
            ),
            Text(
              subTitle,
              style: TextStyle(
                  fontSize: 12,
                  color: isWhite == true ? Colors.white : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
