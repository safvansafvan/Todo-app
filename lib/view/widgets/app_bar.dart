import 'package:flutter/material.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/controller/const/height.dart';
import 'package:todo/view/search.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: Column(
        children: [
          commonHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 25,
                  child: Icon(Icons.menu_outlined, size: 30),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: const Text(
                    'All ToDos',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: kwhite),
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchView(),
                            ));
                      },
                      icon: const Icon(Icons.search)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
