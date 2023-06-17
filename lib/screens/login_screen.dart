import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod/provider/auth_provider.dart';
import 'package:todo_riverpod/screens/home_screen.dart';

import '../customtextfield.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          SizedBox(
            height: 30,
          ),
          customTextField(
            controller: _nameController,
            hintText: "Name",
            lowerBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          customTextField(
            controller: _emailController,
            hintText: "Email",
            lowerBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          customTextField(
            controller: _passwordController,
            hintText: "Password",
            lowerBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                await authNotifier.LoginUser().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => HomeScreen(
                              name: _nameController.text,
                            )),
                  ),
                );
              },
              child: authNotifier.isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text("Login"))
        ]),
      ),
    );
  }
}




// ./entercoms.admin   Welcome@123