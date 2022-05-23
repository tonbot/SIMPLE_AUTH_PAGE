//sign in button
  import 'package:authentication_001/constant/color/color.dart';
import 'package:flutter/material.dart';

Container btn() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue[600],
      ),
      child: Text(
        "Sign In",
        style: TextStyle(
          color: white,
          fontSize: 15,
        ),
      ),
    );
  }