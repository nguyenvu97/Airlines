import 'package:airlinesk3/Box/New_Box.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  final child;
  BottomNavigator({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        child: NewBox(child: child),
      ),
    );
  }
}
