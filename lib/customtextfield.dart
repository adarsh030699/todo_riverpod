import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  const customTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    this.lowerBorder,
  }) : _controller = controller;

  final TextEditingController _controller;
  final hintText;
  final lowerBorder;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: _controller,
      decoration: InputDecoration(
        border: lowerBorder,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
