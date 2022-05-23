import 'package:authentication_001/constant/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: primary));

    return const MaterialApp(
       
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: login(),
    );
  }
}

