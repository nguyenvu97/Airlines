import 'package:airlinesk3/Box/New_Book_container.dart';
import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:airlinesk3/Views/Appbar/Text_Input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Find_By_Order extends StatefulWidget {
  const Find_By_Order({super.key});

  @override
  State<Find_By_Order> createState() => _Find_By_OrderState();
}

class _Find_By_OrderState extends State<Find_By_Order> {
  TextEditingController Number = TextEditingController();
  TextEditingController FullName = TextEditingController();

  // ! if not have data return notifai for user
  //# bool isData = false
  //  if( isData ?? true ) => container
  // * if have data container Infomation ticket
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        name: "Booking Management",
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(8),
            height: media.height * 0.3,
            width: media.width * 1,
            child: NewBooxCOntainer(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Please enter the information below to look up itinerary information and add additional services",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  )),
                  Expanded(
                    child: TextFailInput(
                      obscureText: false,
                      controller: Number,
                      textName: "Booking code",
                    ),
                  ),
                  Expanded(
                    child: TextFailInput(
                      obscureText: false,
                      controller: FullName,
                      textName: "First and last name",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(20),
          Container(
            height: 100,
            width: 100,
            child: NewBox(child: Text("hahaha")),
          )
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Container(
          height: media.height * 0.1,
          width: media.width * 0.6,
          child: NewBox(child: Text("Search by Booking Code")),
        ),
      ),
    );
  }
}
// linh trinh bay
// ho ten
// ma ve
// tg
// ten may bay
// sô ghê
//
