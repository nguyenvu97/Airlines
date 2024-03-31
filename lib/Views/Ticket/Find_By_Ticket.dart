import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Home/Home_pape.dart';
import 'package:airlinesk3/Views/Ticket/Choose_Ticket.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FindByTicket extends StatefulWidget {
  const FindByTicket({super.key});

  @override
  State<FindByTicket> createState() => _FindByTicketState();
}

final List<String> flights = [
  'Flight1',
  'abc',
  'andaj',
  'dnsahdh',
  '¥sndhw',
];
String selectFindBy = "";

Map<int, String> Usertype = {
  0: "Children",
  1: "Adult",
};
int Customer = 1;
int Children = 0;

// "Người Lớn", "Trẻ Em"
String Start = "";
String End = "";
DateTime? TimeGo;
DateTime? TimeCallBack;
DateTime dateTime = DateTime.now();
String Notification = "Notification";

class _FindByTicketState extends State<FindByTicket>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      if (_tabController.index == 0) {
        selectFindBy = "Round_trip";
      } else if (_tabController.index == 1) {
        selectFindBy = "One-Way";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void updateUserType(int key) {
    setState(() {
      if (key == 1) {
        Customer++;
        return;
      } else {
        Children += 1;

        return;
      }
    });
  }

  void removeUserType(int key) {
    setState(() {
      if (key == 1) {
        Customer--;
        if (Customer < 1) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(Notification),
              content: Text('The number of customers is less than zero'),
            ),
          );
          Customer = Customer + 1;
          return;
        }
      } else {
        Children--;
        return;
      }
    });
  }

  void swapItems() {
    setState(() {
      String swap = Start;
      Start = End;
      End = swap;
    });
  }

  bool? CheckAddress(String start, String end) {
    if (start.contains(end)) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(Notification),
          content: Text(
              'The origin address and destination address cannot be the same. Please select again.'),
        ),
      );
      return null;
    } else {
      return true;
    }
  }

  DateTime? checkTime(DateTime? timeGo, DateTime? timeCallBack) {
    if (timeGo != null && timeCallBack != null) {
      if (timeGo.isAfter(timeCallBack)) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(Notification),
            content: Text(
                'The return date cannot be before the departure date. Please select again.'),
          ),
        );
        return null;
      }
    }
    return timeCallBack;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade300,
            title: Text(
              "Find Flights",
              maxLines: 1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            leading: Container(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            bottom: TabBar(controller: _tabController, tabs: [
              Tab(
                child: NewBox(child: Text("Round_trip")),
              ),
              Tab(
                child: NewBox(child: Text("One-Way")),
              ),
            ]),
          ),
          body: TabBarView(children: [
            // page 1
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdressAndTime(
                          media,
                          context,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                swapItems();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 70,
                                width: 70,
                                child: NewBox(
                                  child: Icon(Icons.refresh),
                                ),
                              ),
                            )
                          ],
                        ),
                        GoAndCallBack(media, context)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: media.height * 0.11,
                        width: media.width * 0.8,
                        child: NewBox(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(right: media.width * 0.45),
                              child: Text(
                                "Passenger",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: media.width * 0.6,
                                    child: Row(
                                      children: [
                                        Text(
                                          "0${Customer.toString()}",
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          Children > 0
                                              ? "Adult And 0${Children} Children"
                                              : "Adult",
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 50,
                                      child: ChooseBigUserAndKiss(context))
                                ],
                              ),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // page 2
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AdressAndTime(media, context),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                swapItems();
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                height: 70,
                                width: 70,
                                child: NewBox(
                                  child: Icon(Icons.refresh),
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: media.height * 0.15,
                              width: media.width * 0.3,
                              child: NewBox(
                                  child: Column(children: [
                                Container(
                                  height: 50,
                                  child: Text(
                                    "Departurn",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2100),
                                    ).then((selectedDate) {
                                      setState(() {
                                        TimeGo = selectedDate;
                                      });
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      TimeGo != null
                                          ? DateFormat('dd/MM/yyyy')
                                              .format(TimeGo!)
                                          : "+",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ])),
                            ),
                            SizedBox(
                              height: media.height * 0.07,
                            ),
                            //
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: media.height * 0.11,
                        width: media.width * 0.8,
                        child: NewBox(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(right: media.width * 0.45),
                              child: Text(
                                "Passenger",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: media.width * 0.6,
                                    child: Row(
                                      children: [
                                        Text(
                                          "0${Customer.toString()}",
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          Children > 0
                                              ? "Adult And 0${Children} Children"
                                              : "Adult",
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      height: 50,
                                      child: ChooseBigUserAndKiss(context))
                                ],
                              ),
                            )
                          ],
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          bottomNavigationBar: GestureDetector(
            onTap: () {
              String? number = Usertype.entries
                  .firstWhere((entry) => entry.value == "Adult")
                  ?.key
                  .toString();

              String? children = Usertype.entries
                  .firstWhere((entry) => entry.value == "Children")
                  ?.key
                  .toString();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Chooseflight(
                            category: selectFindBy.contains("One-Way")
                                ? "One-Way"
                                : "Round_trip",
                            adult: number,
                            customer: Customer,
                            children: Children,
                            childrenName: children,
                          )));
              print(
                selectFindBy.contains("One-Way") ? "One-Way" : "Round_trip",
              );
            },
            child: Container(
              width: media.width * 0.8,
              padding: EdgeInsets.all(20),
              height: media.height * 0.1,
              child: NewBox(
                child: Text(
                  "Find Flights",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )),
    );
  }

  Container ChooseBigUserAndKiss(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final List<MapEntry<int, String>> items =
                      Usertype.entries.toList();
                  final MapEntry<int, String> entry = items[index];
                  int key1 = entry.key;
                  String value = entry.value;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // Đóng BottomSheet và trả về giá trị của chuyến bay
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.all(25),
                          child: NewBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  child: Text(
                                    key1.toString(),
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 100,
                                  width: 200,
                                  child: Text(
                                    value,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            removeUserType(entry.key);
                                          },
                                          child: Container(
                                            child: Icon(Icons.remove),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            updateUserType(entry.key);
                                          },
                                          child: Container(
                                            child: Icon(Icons.add),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: Usertype.length,
              );
            },
          );
        },
        icon: Icon(Icons.arrow_drop_down),
      ),
    );
  }

// OK
  Column GoAndCallBack(Size media, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: media.height * 0.15,
          width: media.width * 0.3,
          child: NewBox(
              child: Column(children: [
            Container(
              height: 50,
              child: Text(
                "Departurn",
                maxLines: 1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                ).then((selectedDate) {
                  setState(() {
                    TimeGo = selectedDate;
                  });
                });
              },
              child: Center(
                child: Text(
                  TimeGo != null
                      ? DateFormat('dd/MM/yyyy').format(TimeGo!)
                      : "+",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ])),
        ),
        SizedBox(
          height: media.height * 0.07,
        ),
        Visibility(
          visible: selectFindBy.contains("Round_trip"),
          child: Container(
            height: media.height * 0.15,
            width: media.width * 0.3,
            child: NewBox(
                child: Column(
              children: [
                Container(
                  height: 50,
                  child: Text(
                    "Return",
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    ).then((selectedDate) {
                      setState(() {
                        TimeCallBack = checkTime(TimeGo, selectedDate);
                      });
                    });
                  },
                  child: Center(
                    child: Text(
                      TimeCallBack != null
                          ? DateFormat('dd/MM/yyyy').format(TimeCallBack!)
                          : "+",
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            )),
          ),
        ),
      ],
    );
  }

  Column AdressAndTime(
    Size media,
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: media.height * 0.15,
          width: media.width * 0.3,
          child: NewBox(
              child: Column(
            children: [
              Container(
                height: 50,
                child: Text(
                  "Departurn",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final item = flights[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                Start = item;
                              });
                              print(Start);
                              Navigator.pop(
                                  context); // Đóng BottomSheet và trả về giá trị của chuyến bay
                            },
                            child: Column(
                              children: [
                                NewBox(
                                  child: Text(
                                    item, // Hiển thị tên của chuyến bay
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: flights.length,
                      );
                    },
                  );
                },
                child: Center(
                  child: Text(
                    Start.isNotEmpty ? Start : "+",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
        SizedBox(
          height: media.height * 0.07,
        ),
        Container(
          height: media.height * 0.15,
          width: media.width * 0.3,
          child: NewBox(
              child: Column(
            children: [
              Container(
                height: 50,
                child: Text(
                  "To",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final item = flights[index];
                          return GestureDetector(
                            onTap: () {
                              bool? isValid = CheckAddress(Start, item);
                              if (isValid != null && isValid) {
                                setState(() {
                                  End = item;
                                });
                                Navigator.pop(
                                    context); // Đóng BottomSheet và trả về giá trị của chuyến bay
                              }
                            },
                            child: Column(
                              children: [
                                NewBox(
                                  child: Text(
                                    item, // Hiển thị tên của chuyến bay
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: flights.length,
                      );
                    },
                  );
                },
                child: Center(
                  child: Text(
                    End.isNotEmpty ? End : "+",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      ],
    );
  }
}

// Hành Khách
// Người Lớn, Trẻ Em;

//Mã Khuyến Mại

// Tim Kiếm Chuyến Bay
