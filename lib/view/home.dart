import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/controller/provider/db_controller.dart';
import 'package:todo/view/widgets/add_todo.dart';
import 'package:todo/view/widgets/app_bar.dart';
import 'package:todo/view/widgets/todo_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<DbController>(context, listen: false).getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController? scrollController;
    return Scaffold(
      backgroundColor: kbackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarHome(),
          Expanded(
            child: Consumer<DbController>(
              builder: (context, provider, _) {
                provider.getItems();
                if (provider.todoList.isEmpty) {
                  return Center(
                    child: Lottie.asset('assets/animation/empty.json'),
                  );
                } else {
                  return ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final listValue = provider.todoList[index];
                      DateTime date = DateTime.parse(listValue['createdAt']);
                      String formatedDate = DateFormat().add_yMd().format(date);
                      return Todo_tile_view(
                        listValue: listValue,
                        formatedDate: formatedDate,
                        provider: provider,
                      );
                    },
                    itemCount: provider.todoList.length,
                  );
                }
              },
            ),
          ),
          AddTodoWidget(),
        ],
      ),
    );
  }
}
