import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:flutter/material.dart';

class AppbarSetting extends StatefulWidget {
  const AppbarSetting({super.key});

  @override
  State<AppbarSetting> createState() => _AppbarSettingState();
}

class _AppbarSettingState extends State<AppbarSetting> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(name: "Cài Đặt"),
      body: Container(
        padding: EdgeInsets.all(20),
        height: media.height * 0.4,
        width: media.width * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: NewBox(
              child: SettingCloum(media, "Currency", "VND"),
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: NewBox(
              child: SettingCloum(media, "Application Version", "5.1.2(2024)"),
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: NewBox(
              child: SettingCloum(
                  media, "Country/Language", "Vietnamese Name/English"),
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: NewBox(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notification",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          })
                    ]),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Container SettingCloum(Size media, String name, String name2) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: media.width * 0.6),
            child: Text(
              name,
              maxLines: 1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          )),
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(right: media.width * 0.7),
                  child: Text(
                    name2,
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  )))
        ],
      ),
    );
  }
}
