import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/controller/provider/db_controller.dart';
import 'package:todo/view/widgets/todo_list_tile.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController? controller;
    final provider = Provider.of<DbController>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 25,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            ),
          ),
          title: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                color: kgrey,
                blurStyle: BlurStyle.solid,
                spreadRadius: 1,
              ),
            ], color: kwhite, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: TextField(
                controller: provider.search,
                onChanged: (value) {
                  provider.searchTodo(provider.search.text);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        provider.clearSearch();
                      },
                      icon: const Icon(Icons.close)),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
        ),
        body: Consumer<DbController>(builder: (context, value, child) {
          value.getItems();
          if (value.stillSearchTodo.isEmpty) {
            return Center(
              child: Lottie.asset('assets/animation/empty.json'),
            );
          } else {
            return ListView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final listValue = value.stillSearchTodo[index];
                DateTime date = DateTime.parse(listValue['createdAt']);
                String formatedDate = DateFormat().add_yMd().format(date);
                return Todo_tile_view(
                  isSearch: true,
                  listValue: listValue,
                  formatedDate: formatedDate,
                  provider: value,
                );
              },
              itemCount: value.stillSearchTodo.length,
            );
          }
        }));
  }
}
