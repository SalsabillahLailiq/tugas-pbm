import 'package:flutter/material.dart';
import 'page/login_page.dart';
import 'page/register_page.dart';
import 'page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TugasPBM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      routes: {
        "/register": (context) => RegisterPage(),
        "/login": (context) => LoginPage(),
        "/homepage": (context) => HomePage(),
      },
      home: LoginPage(),
    );
  }
}