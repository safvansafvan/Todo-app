import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/controller/provider/db_controller.dart';
import 'package:todo/view/widgets/add_todo.dart';
import 'package:todo/view/widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            child: Consumer<DbController>(builder: (context, provider, _) {
              return FutureBuilder(
                  future: provider.getItems(),
                  builder: (context, snap) {
                    return ListView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final listValue = provider.todoList[index];
                          DateTime date =
                              DateTime.parse(listValue['createdAt']);
                          String formatedDate =
                              DateFormat().add_yMd().format(date);
                          return Container(
                            height: 70,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withAlpha(100),
                                      Colors.grey
                                    ]),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: ListTile(
                                leading: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.check_box)),
                                title: Text(listValue['title']),
                                subtitle: Text(formatedDate),
                                trailing: Container(
                                  height: 38,
                                  width: 39,
                                  decoration: BoxDecoration(
                                      color: kred,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        color: kwhite,
                                      )),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: provider.todoList.length);
                  });
            }),
          ),
          AddTodoWidget()
        ],
      ),
    );
  }
}
