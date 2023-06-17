import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future LoginUser() async {
    setLoading(true);

    await Future.delayed(Duration(seconds: 2))
        .then((value) => setLoading(false));
  }

  Future SaveTask() async {
    setLoading(true);
    await Future.delayed(Duration(seconds: 2))
        .then((value) => setLoading(false));
  }
}

final authProvider = ChangeNotifierProvider((ref) => AuthProvider());
