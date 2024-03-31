import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Box/TopPicksCell.dart';
import 'package:airlinesk3/Views/Appbar/Appbar_Setting.dart';
import 'package:airlinesk3/Views/Appbar/More_Appbar.dart';
import 'package:airlinesk3/Views/Find_By_Order_Ok/Find_By_Order.dart';

import 'package:airlinesk3/Views/LoginRegister/new_login.dart';
import 'package:airlinesk3/Views/Ticket/Find_By_Ticket.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _currentIndex = 0;

ScrollController? controller;

List topPicksArr = [
  {"img": "assets/1.jpeg"},
  {"img": "assets/2.jpeg"},
  {"img": "assets/3.jpeg"}
];

List<Map<String, dynamic>> gridItems = [
  {
    'text': 'Khách Sạn',
    'imagePath': 'assets/khachsan.jpeg',
  },
  {
    'text': 'Hành Lý Ký Gửi',
    'imagePath': 'assets/hanhly3.jpeg',
  },
  {
    'text': 'Chọn Chỗ Ngồi',
    'imagePath': 'assets/shit.jpeg',
  },
  {
    'text': 'Phòng Chờ Thương Gia',
    'imagePath': 'assets/phongcho.png',
  },
  {
    'text': 'Quà tặng',
    'imagePath': 'assets/gif.jpeg',
  },
  {
    'text': 'Đặt Xe',
    'imagePath': 'assets/texi1.jpeg',
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.grey.shade400,
            elevation: 0,
            primary: true,
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/Logo2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            leading: null,
            leadingWidth: 0,
            actions: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomerSearchView(),
                        );
                      },
                      icon: Icon(Icons.search),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppbarSetting()));
                        },
                        icon: Icon(Icons.settings)),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreView()));
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: media.width,
                  height: media.width * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Hello!",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => newLogin(),
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Login Now",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: media.width,
                  height: media.height * 0.2,
                  child: CarouselSlider.builder(
                    itemCount: topPicksArr.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      var iObj = topPicksArr[itemIndex] as Map? ?? {};
                      return TopPicksCell(
                        iObj: iObj,
                      );
                    },
                    options: CarouselOptions(
                      autoPlayInterval: Duration(seconds: 20),
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                      enlargeFactor: 0.4,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "To make the trip more complete",
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Số lượng cột
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Lấy thông tin cho ô hiện tại từ danh sách gridItems
                Map<String, dynamic> item = gridItems[index];
                return Container(
                  height: media.height * 0.2,
                  width: media.width * 0.4,
                  padding: EdgeInsets.all(10),
                  child: NewBox(
                    child: Column(
                      children: [
                        Container(
                          height: 20,
                          child: Text(
                            item['text'],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ), // Hiển thị văn bản từ danh sách
                        ),
                        Container(
                          height: media.height * 0.16,
                          width: media.width * 0.4,
                          child: Image.asset(
                            item['imagePath'],
                            fit: BoxFit.cover,
                          ), // Hiển thị ảnh từ danh sách
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: gridItems.length, // Số lượng mục trong danh sách
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        borderRadius: Radius.circular(30),
        iconSize: 20,
        selectedColor: Color.fromARGB(255, 5, 4, 5),
        strokeColor: Color(0x30040307),
        unSelectedColor: Colors.white,
        backgroundColor: Colors.grey.shade400,
        items: [
          CustomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.home)),
            title: Text("Home"),
          ),
          CustomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindByTicket()));
                },
                child: Icon(Icons.airplanemode_active)),
            title: Text("Buy ticket"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text("Book Hotel"),
          ),
          CustomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Find_By_Order()));
                },
                child: Icon(Icons.date_range)),
            title: Text(
              "Schedules",
              maxLines: 1,
            ),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Me"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class CustomerSearchView extends SearchDelegate {
  List<String> data = [
    "Fiction",
    "Non-Fiction",
    "Science",
    "Mystery",
    "Thriller",
    "Romance",
    "Fantasy",
    "Biography",
    "History",
    "Self-Help"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        // key: sideMenuScaffoldKey,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var kq = matchQuery[index];
        return ListTile(
          title: Text(kq),
          onTap: () {
            query = kq;
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        final kq = matchQuery[index];
        return ListTile(
          title: Text(kq),
          onTap: () {
            query = kq;
          },
        );
      },
    );
  }
}
