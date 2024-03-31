import 'package:airlinesk3/Box/New_Box.dart';
import 'package:airlinesk3/Test/Test.dart';
import 'package:airlinesk3/Views/Find_By_Order_Ok/Find_By_Order.dart';
import 'package:airlinesk3/Views/Home/Home_pape.dart';
import 'package:airlinesk3/Views/LoginRegister/Resgister_Page.dart';

import 'package:airlinesk3/Views/LoginRegister/new_login.dart';
import 'package:airlinesk3/Views/Ticket/Choose_Ticket.dart';
import 'package:airlinesk3/Views/Ticket/CustomTabBar.dart';
import 'package:airlinesk3/Views/Ticket/Find_By_Ticket.dart';
import 'package:airlinesk3/Views/Ticket/Input_User_Info.dart';
import 'package:airlinesk3/Views/Ticket/Patment_Ticket.dart';
import 'package:airlinesk3/Test/CounterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      // home: BlocProvider(
      //   create: (_) => CounterCubit(),
      //   child: CounterPage(),
      // ),
    );
  }
}
