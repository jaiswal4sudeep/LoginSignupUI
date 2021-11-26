import 'package:flutter/material.dart';
import 'package:intro/pages/HomePage.dart';
import 'package:intro/pages/LoginPage.dart';
import 'package:intro/pages/sign_up.dart';
import 'package:intro/utils/routes.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.signupRoute,
      routes: {
        "/": (context) => SignUpPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.signupRoute: (context) => SignUpPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
