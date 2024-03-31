import 'package:airlinesk3/Box/New_Book_container.dart';
import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Service/funcCheck/Check_Anything.dart';
import 'package:airlinesk3/Views/Appbar/Text_Input.dart';
import 'package:airlinesk3/Views/Home/Home_pape.dart';
import 'package:airlinesk3/Views/LoginRegister/Resgister_Page.dart';
import 'package:flutter/material.dart';

class newLogin extends StatefulWidget {
  const newLogin({super.key});

  @override
  State<newLogin> createState() => _newLoginState();
}

TextEditingController EmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();

bool _isobscureText = true;

class _newLoginState extends State<newLogin> {
  void _onLoginPressed() async {
    String email = EmailController.text.trim();
    String password = PasswordController.text.trim();

    bool? isEmailValid = await CheckEmail();
    bool? isPasswordValid = await checkPassword();

    if (isEmailValid != null &&
        isEmailValid &&
        isPasswordValid != null &&
        isPasswordValid) {
      // bool loginSuccess = await UserService().Login(email, password);
      bool loginSuccess = false;

      if (loginSuccess) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed'),
              content: Text('Please check your email and password.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  // check Email VS password
  CheckAnything checker = CheckAnything();

  Future<bool?> checkPassword() async {
    String password = PasswordController.text;
    bool? isPasswordValid = await checker.CheckPassword(password);
    if (isPasswordValid != null && isPasswordValid) {
      return true;
    } else {
      final snackBar = SnackBar(
        content: Text('You entered the wrong Password format'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

// Gọi phương thức kiểm tra độ dài của chuỗi bất kỳ
  Future<bool?> CheckEmail() async {
    String email = EmailController.text;
    bool? isLengthValid = await checker.checkEmail(email);
    if (isLengthValid != null && isLengthValid) {
      return true;
    } else {
      final snackBar = SnackBar(
        content: Text('You entered the wrong email format'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

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
                  height: media.height * 0.3,
                ),
                Container(
                  height: media.height * 0.5,
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
                          "Login",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                      Container(
                        height: 80,
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
                        height: 80,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: NewBox(
                          child: TextFailInput(
                            textName: "Password",
                            controller: PasswordController,
                            obscureText: _isobscureText,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _onLoginPressed();
                            });
                          },
                          child: Container(
                            height: media.height * 0.07,
                            width: media.width,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: media.height * 0.04,
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "For Get PassWorld??",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResgisterPage()));
                              },
                              child: Container(
                                height: media.height * 0.04,
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  "Resgitser",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ]),
                      Container(
                        height: media.height * 0.05,
                        width: media.width * 0.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                height: media.height * 0.04,
                                child: Icon(
                                  Icons.facebook_rounded,
                                  size: 45,
                                  color:
                                      const Color.fromARGB(255, 64, 167, 251),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: media.height * 0.04,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://cdn-icons-png.freepik.com/512/2875/2875331.png"))),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: media.height * 0.04,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Apple_Computer_Logo_rainbow.svg/514px-Apple_Computer_Logo_rainbow.svg.png"))),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
