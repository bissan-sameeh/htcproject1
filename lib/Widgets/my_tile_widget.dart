import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myListTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData icon;
  final bool show;
  final Function()? onTap;

  const myListTile({
    super.key,
    required this.title,
    this.subTitle,
    this.show = true,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return show == true
        ? InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blue[900],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subTitle != null ? Text(subTitle!) : const SizedBox.shrink()
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue[900],
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
