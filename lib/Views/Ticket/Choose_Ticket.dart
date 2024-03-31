import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Appbar/ButtonNavigator.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:airlinesk3/Views/Ticket/CustomTabBar.dart';
import 'package:airlinesk3/Views/Ticket/Customer_TapBar_One_Way.dart';
import 'package:airlinesk3/Views/Ticket/Input_User_Info.dart';
import 'package:airlinesk3/Views/Ticket/Patment_Ticket.dart';
import 'package:airlinesk3/Views/Ticket/Rank_User.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';

class Chooseflight extends StatefulWidget {
  int customer;
  int children;
  String? childrenName;
  String? adult;
  String category;
  Chooseflight(
      {super.key,
      required this.adult,
      required this.customer,
      required this.children,
      required this.category,
      required this.childrenName});

  @override
  State<Chooseflight> createState() => _ChooseflightState();
}

class _ChooseflightState extends State<Chooseflight>
    with SingleTickerProviderStateMixin {
  int activeStep = 0;

  String selectedDate = "";
  bool isRouterGoAndBack = false;
  bool _isRankUser = false;
  late TabController controller;
  String ticket = "Normal";
  String ticKetVip = "Vip";
  String token = "4324wưew";

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        name: "Buy Airline Tickets",
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 70,
              child: NewBox(
                child: IconStepper(
                  stepColor: Colors.white,
                  lineLength: 20,
                  icons: [
                    Icon(
                      Icons.airplanemode_active,
                      size: 8,
                    ),
                    Icon(
                      Icons.person,
                      size: 8,
                    ),
                    if (token != null && token.isNotEmpty)
                      Icon(
                        Icons.star,
                        size: 8,
                      ),
                    Icon(
                      Icons.payment,
                      size: 8,
                    ),
                  ],

                  activeStep: activeStep,

                  // This ensures step-tapping updates the activeStep.
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                ),
              ),
            ),
            header(),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(5),
            ),
            child: headerText(),
          ),
        ),
      ],
    );
  }

  // Returns the header text based on the activeStep.
  Widget headerText() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    List<DateTime> futureDates = [];
    List<String> formattedFutureDates = [];
    futureDates.add(now);
    formattedFutureDates.add(formattedDate);

    for (int i = 1; i <= 7; i++) {
      DateTime futureDate = now.add(Duration(days: i));
      futureDates.add(futureDate);
      String formattedFutureDate = DateFormat('dd/MM/yyyy').format(futureDate);
      formattedFutureDates.add(formattedFutureDate);
    }
    if (widget.category.contains("Round_trip")) {
      if (token.isNotEmpty) {
        if (activeStep == 1) {
          if (selectedDate.isNotEmpty && isRouterGoAndBack ?? true) {
            return Column(
              children: [
                Container(
                  height: 650,
                  child: UserInfo(
                    adult: widget.adult,
                    customer: widget.customer,
                    children: widget.children,
                    childrenName: widget.childrenName,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedDate.isNotEmpty) {
                      setState(() {
                        activeStep = 2;
                      });
                    } else {
                      setState(() {
                        activeStep = 0;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 400,
                    child: NewBox(child: Text("Continue")),
                  ),
                )
              ],
            );
          } else {
            setState(() {
              activeStep = 0;
            });
            return HeardFlightRoute(
              formattedDate,
              formattedFutureDates,
            );
          }
        } else if (activeStep == 2) {
          return Column(
            children: [
              Container(
                  height: 650,
                  child: RankUser(
                    isRankUser: _isRankUser,
                    onIsRouterCallbackChanged: (value) => setState(() {
                      _isRankUser = value;
                      print("_isRankUser + ${_isRankUser}");
                    }),
                  )),
              GestureDetector(
                onTap: () {
                  print("object ${_isRankUser}");
                  if (_isRankUser ?? true) {
                    setState(() {
                      activeStep = 3;
                    });
                  } else {
                    setState(() {
                      activeStep == 2;
                    });
                  }
                },
                child: Container(
                  height: 70,
                  width: 400,
                  child: NewBox(child: Text("Continue")),
                ),
              )
            ],
          );
        } else if (activeStep == 3) {
          return PaymentTicket();
        } else {
          return HeardFlightRoute(formattedDate, formattedFutureDates);
        }
      } else {
        if (activeStep == 1) {
          return Column(
            children: [
              Container(
                height: 650,
                child: UserInfo(
                  adult: widget.adult,
                  customer: widget.customer,
                  children: widget.children,
                  childrenName: widget.childrenName,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(activeStep);
                  setState(() {
                    activeStep = 2;
                  });
                },
                child: Container(
                  height: 70,
                  width: 400,
                  child: NewBox(child: Text("Continue")),
                ),
              )
            ],
          );
        } else if (activeStep == 2) {
          return PaymentTicket();
        } else {
          return HeardFlightRoute(formattedDate, formattedFutureDates);
        }
      }

      //! ??????????????? Onw_Way
    } else {
      if (token.isNotEmpty) {
        if (activeStep == 1) {
          if (selectedDate.isNotEmpty) {
            return Column(
              children: [
                Container(
                  height: 650,
                  child: UserInfo(
                    adult: widget.adult,
                    customer: widget.customer,
                    children: widget.children,
                    childrenName: widget.childrenName,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedDate.isNotEmpty) {
                      setState(() {
                        activeStep = 2;
                      });
                    } else {
                      setState(() {
                        activeStep = 0;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 400,
                    child: NewBox(child: Text("ContinueOne_way1")),
                  ),
                )
              ],
            );
          } else {
            setState(() {
              activeStep = 0;
            });
            return HeardFlightRoute1(
              formattedDate,
              formattedFutureDates,
            );
          }
        } else if (activeStep == 2) {
          return Column(
            children: [
              Container(
                  height: 650,
                  child: RankUser(
                    isRankUser: _isRankUser,
                    onIsRouterCallbackChanged: (value) => setState(() {
                      _isRankUser = value;
                      print("_isRankUser + ${_isRankUser}");
                    }),
                  )),
              GestureDetector(
                onTap: () {
                  print("object ${_isRankUser}");
                  if (_isRankUser ?? true) {
                    setState(() {
                      activeStep = 3;
                    });
                  } else {
                    setState(() {
                      activeStep == 2;
                    });
                  }
                },
                child: Container(
                  height: 70,
                  width: 400,
                  child: NewBox(child: Text("Continue")),
                ),
              )
            ],
          );
        } else if (activeStep == 3) {
          return PaymentTicket();
        } else {
          return HeardFlightRoute1(formattedDate, formattedFutureDates);
        }
      } else {
        if (activeStep == 1) {
          return Column(
            children: [
              Container(
                height: 650,
                child: UserInfo(
                  adult: widget.adult,
                  customer: widget.customer,
                  children: widget.children,
                  childrenName: widget.childrenName,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(activeStep);
                  setState(() {
                    activeStep = 2;
                  });
                },
                child: Container(
                  height: 70,
                  width: 400,
                  child: NewBox(child: Text("Continue")),
                ),
              )
            ],
          );
        } else if (activeStep == 2) {
          return PaymentTicket();
        } else {
          return HeardFlightRoute(formattedDate, formattedFutureDates);
        }
      }
    }
  }

  Column HeardFlightRoute(
      String formattedDate, List<String> formattedFutureDates) {
    return Column(
      children: [
        Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                width: 1000,
                child: Row(
                  children: [
                    for (String date in formattedFutureDates)
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewBox(
                              child: Text(date),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 70,
          width: 400,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(height: 100, child: Icon(Icons.airplanemode_active)),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate.toString(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        isRouterGoAndBack ? "RouTerBack" : "RouterGo",
                        maxLines: 1,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 460,
          padding: EdgeInsets.all(20),
          child: NewBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  child: CustomTabBar(
                    catecory: "Round_trip",
                    dateTime: selectedDate.toString(),
                    ticket: ticket,
                    ticKetVip: ticKetVip,
                    isRouterCallback: isRouterGoAndBack,
                    onIsRouterCallbackChanged: (newValue) {
                      setState(() {
                        isRouterGoAndBack = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // ma giam gia
        Container(
          height: 70,
          width: 400,
          child: BottomNavigator(
            child: GestureDetector(
              onTap: () {
                if (isRouterGoAndBack ?? true) {
                  setState(() {
                    activeStep = 1;
                  });
                }
              },
              child: Text("Continue"),
            ),
          ),
        )
      ],
    );
  }

  //!  ONE_Way
  Column HeardFlightRoute1(
      String formattedDate, List<String> formattedFutureDates) {
    return Column(
      children: [
        Container(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                width: 1000,
                child: Row(
                  children: [
                    for (String date in formattedFutureDates)
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = date;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewBox(
                              child: Text(date),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          height: 70,
          width: 400,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(height: 100, child: Icon(Icons.airplanemode_active)),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Text(
                        selectedDate.toString(),
                        maxLines: 1,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "RouterGo",
                        maxLines: 1,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 460,
          padding: EdgeInsets.all(20),
          child: NewBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 400,
                  child: Customer_TapBar_One_Way(
                    dateTime: selectedDate.toString(),
                    ticket: ticket,
                    ticKetVip: ticKetVip,
                    isRouterCallback: isRouterGoAndBack,
                    // onIsRouterCallbackChanged: (newValue) {
                    //   setState(() {
                    //     isRouterGoAndBack = newValue;
                    //   });
                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
        // ma giam gia
        Container(
          height: 70,
          width: 400,
          child: BottomNavigator(
            child: GestureDetector(
              onTap: () {
                if (isRouterGoAndBack ?? true) {
                  setState(() {
                    activeStep = 1;
                  });
                }
              },
              child: Text("Continue"),
            ),
          ),
        )
      ],
    );
  }
}
