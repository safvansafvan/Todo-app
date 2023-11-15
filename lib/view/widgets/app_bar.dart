import 'package:flutter/material.dart';
import 'package:todo/constent/colors.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.menu, size: 35)),
              const CircleAvatar(
                radius: 25,
                child: Icon(Icons.person_outline, size: 30),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.close)),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
