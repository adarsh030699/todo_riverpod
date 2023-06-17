import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/todo_provider.dart';

class EditScreen extends StatelessWidget {
  EditScreen({
    super.key,
    required this.index,
    required this.value,
  });

  final TextEditingController _editcontroller = TextEditingController();
  final int index;
  final String value;

  void setvalue(String value) {
    _editcontroller.text = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        title: Text("Edit task"),
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
                child: TextField(
                  controller: _editcontroller,
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            final todoNotifier = ref.watch(todoProvider);
            return ElevatedButton(
              onPressed: () {
                if (_editcontroller.text.isNotEmpty) {
                  todoNotifier.updateTask(index, _editcontroller.text);
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              },
              child: todoNotifier.isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text("save changes"),
            );
          }),
        ],
      ),
    );
  }
}
