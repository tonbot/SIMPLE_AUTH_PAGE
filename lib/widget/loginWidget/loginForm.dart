// ignore_for_file: camel_case_types, avoid_unnecessary_containers, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:authentication_001/constant/color/color.dart';
import 'package:authentication_001/constant/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utill.dart';

class loginForm extends StatefulWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {

  bool isvisible = true;
  Icon iconn = Icon(Icons.visibility);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();


  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key : _formKey,
          child: Column(
            children: <Widget>[
              _textFormWidget("WEBMAIL", "toyin@gamil.com"), //Text formfied and label
              _passFormWidget("PASSWORD"),   //password field
              Vspace(20.0), //vertical space
              InkWell(
                onTap: () {
                  submit();
                },
                child: btn()
                ), //sign in button
              Vspace(30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _signupText("DON'T HAVE AN ACCOUNT?", "n"),
                  Hspace(10.0),
                  GestureDetector(
                      //signup click link
                      onTap: () {},
                      child: _signupText("SIGN UP", "b")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//signup text
  Text _signupText(String text, String t) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black45,
          fontSize: 13,
          fontWeight: (t == "b") ? FontWeight.bold : FontWeight.normal),
    );
  }

  Widget _textFormWidget(String text, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text, //TEXT LABEL
          style: TextStyle(fontSize: 15, color: Colors.black45),
        ),
        Vspace(10.0),
        TextFormField( //textform field
          controller : _email,
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(),
              prefixIcon:Icon(Icons.people)
            ),
            validator: (value) { //validator
              if (value!.length < 3 ){
                return "Value cannot be less than 5";
              }else{
                return null;
              }
            }),
        Vspace(10.0),
      ],
    );
  }

//password widget
  Column _passFormWidget(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.black45),
        ),
        Vspace(10.0),
        TextFormField(
          controller: _pass,
            obscureText: isvisible,
            decoration: InputDecoration(
              hintText: "12344555",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: _icon(),
            ),
            validator: (value) {}),
        Vspace(10.0),
      ],
    );
  }

//Password toggle suffix icon
  _icon() {
    if (isvisible) {
      return InkWell(
        onTap: () {
          setState(() {
            isvisible = false;
            iconn = Icon(Icons.visibility_off);
          });
        },
        child: iconn,
      );
    } else {
      return InkWell(
        onTap: () {
          setState(() {
            isvisible = true;
            iconn = Icon(Icons.visibility);
          });
        },
        child: iconn,
      );
    }
  }

//submit
  void submit() {
   if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pass")));
   }
  }

//
}//end of the class






