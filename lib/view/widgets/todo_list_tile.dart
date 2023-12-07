// ignore: camel_case_types
import 'package:flutter/material.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/controller/provider/db_controller.dart';

// ignore: camel_case_types
class Todo_tile_view extends StatelessWidget {
  const Todo_tile_view(
      {super.key,
      required this.listValue,
      required this.formatedDate,
      required this.provider,
      this.isSearch = false});

  final Map<String, dynamic> listValue;
  final String formatedDate;
  final DbController provider;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withAlpha(100),
            Colors.grey,
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_box),
          ),
          title: Text(listValue['title']),
          subtitle: Text(formatedDate),
          trailing: Container(
            height: 38,
            width: 39,
            decoration: BoxDecoration(
              color: kred,
              borderRadius: BorderRadius.circular(8),
            ),
            child: isSearch
                ? null
                : IconButton(
                    onPressed: () {
                      provider.deleteValues(listValue['id']);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: kwhite,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
