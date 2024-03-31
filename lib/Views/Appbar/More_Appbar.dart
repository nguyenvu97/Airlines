import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:flutter/material.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {'icon': Icons.home, 'text': 'About us'},
      {'icon': Icons.work, 'text': 'Luggage'},
      {'icon': Icons.school, 'text': 'School'},
      {'icon': Icons.shopping_cart, 'text': 'Shopping'},
      {'icon': Icons.restaurant, 'text': 'Restaurant'},
      {'icon': Icons.local_hospital, 'text': 'Hospital'},
      {'icon': Icons.airplanemode_active, 'text': 'Travel'},
    ];
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        name: "General information",
        actions: [],
      ),
      body: Container(
          height: media.height * 0.45,
          padding: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: NewBox(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final item = dataList[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              NewBox(child: Icon(item['icon'])),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                item['text'],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    })),
          )),
    );
  }
}
