import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class TextFailInput extends StatelessWidget {
  TextEditingController controller;
  String textName;
  bool obscureText;
  TextFailInput(
      {super.key,
      required this.controller,
      required this.textName,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: media.height * 0.05,
        child: AutoSizeTextField(
          controller: controller,
          maxLines: 1,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: textName,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Colors.black)),
          ),
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
