// ignore_for_file: prefer_const_constructors

import 'package:authentication_001/widget/loginWidget/loginForm.dart';
import 'package:flutter/material.dart';
import 'package:authentication_001/widget/loginWidget/stack.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
         stack(),
        loginForm(),
      ]),
    ));
  }
}











