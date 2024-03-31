import 'package:flutter/material.dart';

class NewBooxCOntainer extends StatelessWidget {
  final Widget child;

  NewBooxCOntainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey.shade500,
                offset: Offset(5, 5)),
            BoxShadow(
                blurRadius: 10, color: Colors.white, offset: Offset(-5, -5))
          ]),
    );
  }
}
