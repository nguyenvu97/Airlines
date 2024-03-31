import 'package:airlinesk3/Box/New_Book_container.dart';
import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Appbar/ButtonNavigator.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:airlinesk3/Views/Appbar/Text_Input.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  int customer;

  int children;
  String? childrenName;
  String? adult;
  UserInfo(
      {super.key,
      required this.adult,
      required this.customer,
      required this.children,
      required this.childrenName});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

late List<TextEditingController> adultEmailControllers;
late List<TextEditingController> adultNameControllers;
late List<TextEditingController> adultCountryController;
late List<TextEditingController> adultPhoneController;
late List<TextEditingController> childNameControllers;
late List<TextEditingController> childDateOfBirthControllers;

class _UserInfoState extends State<UserInfo> {
  @override
  void initState() {
    super.initState();
    adultEmailControllers = List.generate(
      widget.customer,
      (index) => TextEditingController(),
    );
    adultNameControllers = List.generate(
      widget.customer,
      (index) => TextEditingController(),
    );
    adultCountryController = List.generate(
      widget.customer,
      (index) => TextEditingController(),
    );
    adultPhoneController = List.generate(
      widget.customer,
      (index) => TextEditingController(),
    );
    print(widget.customer);
    if (widget.children == 0) {
      childNameControllers = [];
    } else {
      childNameControllers = List.generate(
        widget.children,
        (index) => TextEditingController(),
      );
      childDateOfBirthControllers = List.generate(
        widget.children,
        (index) => TextEditingController(),
      );
    }
  }

  int? checkNumber() {
    if (widget.customer >= 1 && widget.children == 0) {
      return 1;
    } else {
      return 2;
    }
  }

  bool? checkInput() {
    if (adultEmailControllers.any((controller) => controller.text.isEmpty)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Notification"),
          content:
              Text('Please input all the information before choosing a seat'),
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.7,
      child: Column(
        children: [
          Container(
            height: media.height * 0.1,
            padding: EdgeInsets.all(10),
            width: 400,
            child: NewBox(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: media.height * 0.1,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            "Total Money",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Text(
                            "1500.1000D",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: media.width * 0.15),
                  height: media.height * 0.1,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
                )),
              ],
            )),
          ),

          // Input Customer

          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: CustomAppBar(
                        name: "Enter Information",
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            for (int i = 0; i < widget.customer; i++)
                              Column(
                                children: [
                                  NewBox(
                                    child: Text(
                                      "Adult${i + 1}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  TextFailInput(
                                    obscureText: false,
                                    textName: "Email",
                                    controller: adultEmailControllers[i],
                                  ),
                                  TextFailInput(
                                    obscureText: false,
                                    textName: "FullName",
                                    controller: adultEmailControllers[i],
                                  ),
                                  TextFailInput(
                                    obscureText: false,
                                    textName: "Country",
                                    controller: adultEmailControllers[i],
                                  ),
                                  TextFailInput(
                                    obscureText: false,
                                    textName: "Phone",
                                    controller: adultNameControllers[i],
                                  ),
                                ],
                              ),
                            // Hiển thị thông tin cho trẻ em
                            Column(
                              children: [
                                for (int i = 0; i < widget.children; i++)
                                  Column(
                                    children: [
                                      NewBox(
                                        child: Text(
                                          "Child${i + 1}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      TextFailInput(
                                        obscureText: false,
                                        textName: "Child Name",
                                        controller: childNameControllers[i],
                                      ),
                                      TextFailInput(
                                        obscureText: false,
                                        textName: "Date Of Birth",
                                        controller: childNameControllers[i],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      bottomNavigationBar: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 70,
                          child: BottomNavigator(child: Text("Complete")),
                        ),
                      ),
                    );
                  },
                );
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 400,
                  child: NewBooxCOntainer(
                      child: Column(
                    children: [
                      Container(
                        height: 30,
                        child: Row(
                          children: [
                            Icon(Icons.person_add_alt_1),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Customer information",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            )
                          ],
                        ),
                      ),

                      //
                      Container(
                        height: 1000,
                        color: Colors.amber,
                        child: ListView.builder(
                          itemCount: checkNumber(),
                          itemBuilder: (context, index) {
                            if (index == 0 || widget.children == 0) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Passengers - Adults",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_box,
                                            color: Color.fromARGB(
                                                255, 173, 157, 8),
                                          ),
                                          SizedBox(width: 2),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: media.width * 0.1),
                                            child: Text(
                                              "Enter Information for Adult",
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 173, 157, 8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (index == 1) {
                              // Container cho trẻ em
                              return Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Passengers - Children",
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.add_box,
                                            color: Color.fromARGB(
                                                255, 173, 157, 8),
                                          ),
                                          SizedBox(width: 2),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: media.width * 0.1),
                                            child: Text(
                                              "Enter Information for Child",
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Color.fromARGB(
                                                    255, 173, 157, 8),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              // Trường hợp không xác định, không hiển thị gì cả
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),

          // Hành lý

          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  checkInput();
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                child: NewBox(
                    child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(Icons.work_history),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Luggage",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                    //
                    Container(
                      width: media.width * 0.8,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: media.width * 0.4),
                            child: Text(
                              "địa ĐIểm đi + về",
                              //Departure + return
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: media.width * 0.4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_box,
                                  color: Color.fromARGB(255, 173, 157, 8),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Extra Luggage Pack",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 173, 157, 8)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),

          // Ghế ngồi

          Expanded(
            child: GestureDetector(
              onTap: () {
                bool? abc = checkInput();
                if (abc ?? true) {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled:
                        true, // Cho phép cuộn nếu nội dung vượt quá kích thước màn hình

                    builder: (BuildContext context) {
                      final double bottomSheetHeight = media.height * 0.9;
                      return Container(
                        height: bottomSheetHeight,
                        child: Scaffold(
                          appBar: CustomAppBar(
                            name: "Choose Your Seat",
                          ),
                          body: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 1000,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(child: GoogleMap("A")),
                                      Expanded(child: GoogleMap("B")),
                                      Expanded(child: GoogleMap("C")),
                                      Expanded(child: GoogleMap("D")),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          bottomNavigationBar: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: Container(
                              height: 70,
                              child: BottomNavigator(child: Text("Complete")),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                width: 400,
                child: NewBox(
                    child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(Icons.airline_seat_recline_extra),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Seat",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          )
                        ],
                      ),
                    ),
                    //
                    Container(
                      width: media.width * 0.8,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: media.width * 0.4),
                            child: Text(
                              "địa ĐIểm đi + về",
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: media.width * 0.4),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_box,
                                  color: Color.fromARGB(255, 173, 157, 8),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "Seat",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 173, 157, 8)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center GoogleMap(String map) {
    // if(){
    return Center(
      child: Container(
        child: Column(
          children: [
            Text(map),
            SizedBox(height: 10), // Khoảng cách giữa Text và hàng ghế
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    for (int i = 1; i <= 10; i++)
                      Seat('$map$i') // Tạo các ghế trong hàng A
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // }
  }

  Widget Seat(String seatNumber) {
    return GestureDetector(
      onTap: () {
        print(seatNumber);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.airline_seat_recline_normal,
              size: 20,
              color: Colors.blue, // Màu của biểu tượng ghế
            ),
            Text(
              seatNumber,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
