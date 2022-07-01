// ignore_for_file: prefer_const_constructors, camel_case_types, use_key_in_widget_constructors

import 'package:authentication_001/constant/color/color.dart';
import 'package:flutter/material.dart';
class stack extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.43 ,
          width: MediaQuery.of(context).size.width,
          color: primary,
        ),
        
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  "FLASH",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                ),
              ),
                Padding(
                  padding: const  EdgeInsets.only(bottom: 40.0),
                  child: SizedBox(
                    height:150,
                    width: 150,
                    child: Image.asset('assets/images/logo.png'),
                    ),
                ),

                Text(
                  "welcome to our flash application",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ],

          ),
        ),

      
      ],
    );
  }
}