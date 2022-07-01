// ignore_for_file: avoid_print

import 'package:authentication_001/constant/color/color.dart';
import 'package:authentication_001/constant/space.dart';
import 'package:authentication_001/controller/dbController.dart';
import 'package:authentication_001/widget/utill.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
 final GlobalKey<FormState> _formKey = GlobalKey<FormState>();   
  bool isvisible = true;
  Icon iconn = const Icon(Icons.visibility);


@override
  void dispose() {
    super.dispose();
    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Icon(
            Icons.close,
            color: Colors.black45,
          ),
        ),
        title: const Text("Sign up",
            style: TextStyle(
              color: Colors.black45,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: stackHeader(context),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: formBody(),
          ),
        ],
      ),
    );
  }

//formBody
  Form formBody() {
    return Form(
      key : _formKey,
      child: Column(
        children: [
          textFormWidget("FULL NAME", false, fullName, "fname"),
          textFormWidget("E-MAIL", false, email, "email"),
          textFormWidget("PHONE-NO",false, phone, "phone" ),
          _passFormWidget("PASSWORD"),
          textFormWidget("CONFIRM PASSWORD", true, cpass, pass),
          Vspace(20.0),
          GestureDetector(
            onTap: (){
              //validate the whole form field
              if(_formKey.currentState!.validate()){
                   
                   _submit();

                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("pass"),));
              }
            },
            child: btn("Create")
            ),
          Vspace(30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              signupText("ALREADY HAVE AN ACCOUNT?", "n"),
              Hspace(10.0),
              InkWell(
                  //signup click link
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: signupText("SIGN IN", "b")),
            ],
          )
        ],
      ),
    );
  }

//stack header
  Stack stackHeader(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            radius: 80.0,
            backgroundColor: primary,
            child: const Icon(
              Icons.person_outline,
              size: 100,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: MediaQuery.of(context).size.width * 0.60,
          child: const CircleAvatar(
            child: Icon(
              Icons.add,
            ),
            radius: 15.0,
          ),
        )
      ],
    );
  }

//password widget
  Column _passFormWidget(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Vspace(10.0),
        TextFormField(
            controller : pass,
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
            iconn = const Icon(Icons.visibility_off);
          });
        },
        child: iconn,
      );
    } else {
      return InkWell(
        onTap: () {
          setState(() {
            isvisible = true;
            iconn = const Icon(Icons.visibility);
          });
        },
        child: iconn,
      );
    }
  }

  // on submit button clicked
void _submit() async{
  // text password match
  if (pass.text != cpass.text){
     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("PASSWORD NOT MATCH"),));
     return;
  }
     
   // get user input
    String a = fullName.text.toString();
    String b = email.text.toString();
    String c = phone.text.toString();
    String d = pass.text.toString();

    //making an object of the database
     var db = DbController();

    //register user
    bool response = await  db.register(a, b, c, d,);

      // on user exist
     if(response){
        DisplayAlertDialog(context,"USER ALREADY EXIST","Oopsss!"); 
        return ;
      }

      // on successfull registration
      DisplayAlertDialog(context,"Registration Successful","SUCCESS"); 
      //clear all textfield
      clearText();

      return;


}



}


