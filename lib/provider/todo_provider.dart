import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<String> _allTodo = [];

  bool get isLoading => _isLoading;
  List<String> get allTodo => _allTodo;

  void addTask(String value) {
    _allTodo.add(value);

    notifyListeners();
  }

  void removeTask(int value) {
    _allTodo.removeAt(value);
    print("deleted ${value}");
    notifyListeners();
  }

  void updateTask(int index, String string) {
    _allTodo[index] = string;
    notifyListeners();
  }
}

final todoProvider = ChangeNotifierProvider((ref) => TodoProvider());
