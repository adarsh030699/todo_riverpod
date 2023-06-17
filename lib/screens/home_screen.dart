import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/provider/todo_provider.dart';
import 'package:todo_riverpod/screens/add_task.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

import 'edit_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddTask(
                            name: name,
                          )),
                );
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Hi,\n${name.toLowerCase()}",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
          Row(children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.grey[400],
                height: 20,
              ),
            )),
            Text(
              " Your tasks ",
              style: TextStyle(color: Colors.grey[400]),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(
                color: Colors.grey[400],
                height: 20,
              ),
            )),
          ]),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final todoNotifier = ref.watch(todoProvider);
              return todoNotifier.allTodo.isNotEmpty
                  ? ListView.builder(
                      itemCount: todoNotifier.allTodo.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          title: GestureDetector(
                            onTap: () {
                              print("tappp");

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditScreen(
                                    index: index,
                                    value: todoNotifier.allTodo[index],
                                  ),
                                ),
                              );

                              print(todoNotifier.allTodo[index]);
                            },
                            child: BlurryContainer(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      todoNotifier.allTodo[index],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          todoNotifier.removeTask(index);
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                              blur: 5,
                              width: 200,
                              height: 70,
                              elevation: 1,
                              color: Colors.transparent,
                              padding: const EdgeInsets.all(8),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: Text(
                        "No tasks",
                        style: TextStyle(color: Colors.grey[300]),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
