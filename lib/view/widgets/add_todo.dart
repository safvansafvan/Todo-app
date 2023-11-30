import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/const/colors.dart';
import 'package:todo/controller/provider/db_controller.dart';
import 'package:todo/view/widgets/toast_msg.dart';

class AddTodoWidget extends StatelessWidget {
  AddTodoWidget({super.key});
  final TextEditingController addController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white.withAlpha(100), Colors.grey])),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: addController,
              decoration: const InputDecoration(
                  hintText: 'Add a new todo item',
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  prefixIcon: Icon(Icons.checklist_sharp)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(8)),
            child: IconButton(
              onPressed: () async {
                await handleAddTodo(context);
              },
              icon: const Icon(Icons.add, color: kwhite, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleAddTodo(context) async {
    final provider = Provider.of<DbController>(context, listen: false);
    if (addController.text.isEmpty) {
      return showToastMsg('ToDo Is Empty');
    } else {
      await provider.addItems(addController.text, DateTime.now().toString());
      showToastMsg('ToDo Added');
      addController.clear();
    }
  }
}
