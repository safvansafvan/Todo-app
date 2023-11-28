import 'package:flutter/material.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/view/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: kwhite, borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: ListTile(
                        leading: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.check_box)),
                        title: const Text('titles'),
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
                itemCount: 10),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.white.withAlpha(100), Colors.grey])),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.checklist_sharp)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: kwhite,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
