import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/screens/login_screen.dart';

void main() {
  runApp(ProviderScope(child: Tododo()));
}

class Tododo extends StatelessWidget {
  const Tododo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
