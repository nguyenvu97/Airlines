import 'package:airlinesk3/Box/New_Book_container.dart';
import 'package:airlinesk3/Box/New_Box.dart';
import 'package:flutter/material.dart';

class RankUser extends StatefulWidget {
  final ValueChanged<bool> onIsRouterCallbackChanged;
  bool isRankUser;
  RankUser(
      {super.key,
      required this.onIsRouterCallbackChanged,
      required this.isRankUser});

  @override
  State<RankUser> createState() => _RankUserState();
}

List<Map<String, dynamic>> items = [
  {
    'image': 'assets/card.jpeg',
    'name': 'Product 1',
    'description':
        'Description 123253467890456789023456789023456789023454354678903243253432523424342354365475867876935463453678',
    'value': 'Value 1',
  },
  {
    'image': 'assets/card.jpeg',
    'name': 'Product 2',
    'description': 'Description 2',
    'value': 'Value 2',
  },
  // Add more items as needed
];

List<bool> isSelected = List.generate(items.length, (_) => false);

class _RankUserState extends State<RankUser> {
  bool isBox = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: 720,
      width: 430,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            padding: EdgeInsets.all(10),
            child: NewBooxCOntainer(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          isSelected[i] = false;
                        }
                        if (!isSelected[index]) {
                          isSelected[index] = true;
                          bool newIsRank = !widget.isRankUser;
                          widget.onIsRouterCallbackChanged(newIsRank);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 35, right: 2),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 2, color: Colors.black),
                        color: isSelected[index]
                            ? const Color.fromARGB(255, 64, 136, 196)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      item['image'],
                      fit: BoxFit.fill,
                      width: 120,
                      height: 100,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                    width: 10,
                  ),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 220,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Promotion: ${item['name']}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: 220,
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Info: ${item['description']}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons
                                      .arrow_drop_down), // Thay icon bằng icon của bạn
                                  onPressed: () {
                                    showBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height:
                                              400, // Đặt chiều cao của BottomSheet tùy ý
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Promotion Information",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text(
                                                          "X",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Description: ${item['description']}",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              SizedBox(height: 20),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            width: 220,
                            child: Text(
                              "Promotion: ${item['value']}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
