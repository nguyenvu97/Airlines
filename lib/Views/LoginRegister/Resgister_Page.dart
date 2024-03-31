import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:airlinesk3/Views/Appbar/Text_Input.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({Key? key}) : super(key: key);

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController FullNameController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  List<String> Aliases = [" Mr", "Ms", " Mrs"];
  String aliases = "";
  bool _isobscureText = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: media.width,
            height: media.height,
            child: Image.network(
              "https://images.unsplash.com/photo-1532920161727-344adb090f7f?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFtYm9vfGVufDB8fDB8fHww",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  title: Image.asset(
                    "assets/Logo2.png",
                    color: Colors.white,
                    width: 100,
                    height: 50,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "X",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: media.height * 0.2,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: media.height * 0.6,
                    width: media.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.shade300),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          padding: EdgeInsets.all(8),
                          width: media.width * 0.8,
                          child: NewBox(
                              child: Text(
                            "Resgister",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          )),
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: NewBox(
                            child: TextFailInput(
                              textName: "Email",
                              controller: EmailController,
                              obscureText: !_isobscureText,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: NewBox(
                            child: TextFailInput(
                              textName: "Password",
                              controller: PasswordController,
                              obscureText: _isobscureText,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: NewBox(
                            child: TextFailInput(
                              textName: "Phone",
                              controller: PhoneController,
                              obscureText: !_isobscureText,
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: NewBox(
                            child: TextFailInput(
                              textName: "Address",
                              controller: AddressController,
                              obscureText: _isobscureText,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: 70,
                                  height: 60,
                                  child: NewBox(
                                    child: DropdownButton<String>(
                                      value:
                                          aliases.isNotEmpty ? aliases : null,
                                      items: Aliases.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          aliases = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: media.width * 0.8,
                                  child: TextFailInput(
                                    obscureText: false,
                                    controller: FullNameController,
                                    textName: "FullName",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                              height: media.height * 0.07,
                              width: media.width,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(40)),
                              child: Center(
                                child: Text(
                                  "Resgister",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: media.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

    // SingleChildScrollView(
    //     scrollDirection: Axis.vertical,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: media.width,
    //           color: Colors.white,
    //           child: Column(
    //             children: [
    //               Container(
    //                 height: media.height * 0.4,
    //                 padding: EdgeInsets.all(8),
    //                 width: media.width,
    //                 decoration: const BoxDecoration(
    //                   color: Colors.white,
    //                   image: DecorationImage(
    //                     image: NetworkImage(
    //                       "https://i.pinimg.com/originals/18/f8/88/18f888ded95d3c351bea2b0bfe63c220.gif",
    //                     ),
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //               Column(
    //                 children: [
    //                   TextFailInput(
    //                     obscureText: false,
    //                     controller: EmailController,
    //                     textName: "Email",
    //                   ),
    //                   TextFailInput(
    //                     obscureText: true,
    //                     controller: PasswordController,
    //                     textName: " Password",
    //                   ),
    //                   TextFailInput(
    //                     obscureText: false,
    //                     controller: PhoneController,
    //                     textName: "Phone",
    //                   ),
    //                   TextFailInput(
    //                     obscureText: false,
    //                     controller: AddressController,
    //                     textName: "Address",
    //                   ),
    //                   Container(
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         InkWell(
    //                           onTap: () {
    //                             showBottomSheet(
    //                               context: context,
    //                               builder: (BuildContext context) {
    //                                 return Scaffold(
    //                                     body: Container(
    //                                   height: 200,
    //                                   child: ListView.builder(
    //                                     itemBuilder: (context, index) {
    //                                       final username = Aliases[index];
    //                                       return InkWell(
    //                                         onTap: () {
    //                                           setState(() {
    //                                             aliases = username;
    //                                           });
    //                                           Navigator.pop(context);
    //                                         },
    //                                         child: Container(
    //                                           child: Text(username),
    //                                         ),
    //                                       );
    //                                     },
    //                                     itemCount: Aliases.length,
    //                                   ),
    //                                 ));
    //                               },
    //                             );
    //                           },
    //                           child: Container(
    //                             padding: EdgeInsets.only(left: 10),
    //                             width: 70,
    //                             height: 60,
    //                             child: NewBox(
    //                               child: Text(
    //                                 aliases.isNotEmpty ? aliases : "Aliases",
    //                                 maxLines: 1,
    //                                 style: TextStyle(
    //                                   fontSize: 15,
    //                                   fontWeight: FontWeight.w500,
    //                                 ),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Container(
    //                           width: media.width * 0.8,
    //                           child: TextFailInput(
    //                             obscureText: false,
    //                             controller: FullNameController,
    //                             textName: "FullName",
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ));

    // bottomNavigationBar: Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: GestureDetector(
    //     onTap: () {},
    //     child: Container(
    //       margin: EdgeInsets.only(bottom: 10),
    //       height: media.height * 0.08,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(20),
    //         color: Colors.red,
    //       ),
    //       child: Center(
    //         child: Text(
    //           "Resgister",
    //           style: TextStyle(
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
