// ignore_for_file: camel_case_types, avoid_unnecessary_containers, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:authentication_001/constant/space.dart';
import 'package:authentication_001/controller/dbController.dart';
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
          key: _formKey,
          child: Column(
            children: <Widget>[
              _textFormWidget(
                  "WEBMAIL", "toyin@gmail.com"), //Text formfied and label
              _passFormWidget("PASSWORD"), //password field
              Vspace(20.0), //vertical space
              InkWell(
                  onTap: () {
                    submit();
                  },
                  child: btn("Sign in")), //sign in button
              Vspace(30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  signupText("DON'T HAVE AN ACCOUNT?", "n"),
                  Hspace(10.0),
                  InkWell(
                      //signup click link
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: signupText("SIGN UP", "b")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFormWidget(String text, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Vspace(10.0),
        TextFormField(
            //textform field
            controller: _email,
            decoration: InputDecoration(
                labelText: text,
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[400],
                ),
                prefixIcon: Icon(Icons.email_outlined)),
            validator: (value) {
              //validator
              return isEmail(value!);
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
        Vspace(10.0),
        TextFormField(
            controller: _pass,
            obscureText: isvisible,
            decoration: InputDecoration(
              labelText: text,
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
              hintText: "12344555",
              hintStyle: TextStyle(
                fontSize: 13,
                color: Colors.grey[400],
              ),
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: _icon(),
            ),
            validator: (value) {
              //validate password filed
              return (value == null || value.isEmpty)
                  ? "Password field cannot be empty"
                  : null;
            }),
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
  void submit() async{
    if (_formKey.currentState!.validate()) {
      // making object of database 
      DbController db = DbController();
      // login user if details is correct
      bool isValid = await db.loginUser(_email.text, _pass.text);

      if(isValid){
        Navigator.pushReplacementNamed(context, "/profile");
        return;
      }

      DisplayAlertDialog(context,"INVALID CREDENTIALS SUPPLY", "ERROR"); 
      return;
           
    }
  }

//
} //end of the class
