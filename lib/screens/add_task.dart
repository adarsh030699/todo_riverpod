import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/customtextfield.dart';

import 'package:todo_riverpod/provider/todo_provider.dart';


class AddTask extends StatelessWidget {
  AddTask({super.key, required this.name});
  final TextEditingController _taskController = TextEditingController();

  final String name;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text("New task"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: customTextField(
                controller: _taskController,
                hintText: " What's your task?",
                lowerBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            final todoNotifier = ref.watch(todoProvider);
            return ElevatedButton(
              onPressed: () {
                if (_taskController.text.isNotEmpty) {
                  todoNotifier.addTask(_taskController.text);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              },
              child: todoNotifier.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text("save"),
            );
          }),
        ],
      ),
    );
  }
}
