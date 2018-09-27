import 'package:flutter/material.dart';
import 'package:flutter_test_auth_2_app/auth.dart';
import 'package:flutter_test_auth_2_app/routes.dart';
import 'dart:io';

void main() => runApp(new LoginApp());

class LoginApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: routes,
    );
  }

  void test() {
    File f = new File("../abc.txt");
  }


}