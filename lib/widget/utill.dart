//sign in button
import 'package:authentication_001/constant/color/color.dart';
import 'package:authentication_001/constant/space.dart';
import 'package:dialogs/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

  // controller declaration 
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController cpass = TextEditingController();

 void clearText(){
        fullName.clear();
        email.clear();
        phone.clear();
        pass.clear();
        cpass.clear();
  }

// button re usable widget
Container btn(String label) {
  return Container(
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.blue[600],
    ),
    child: Text(
      label,
      style: TextStyle(
        color: white,
        fontSize: 15,
      ),
    ),
  );
}
 
 //
Text signupText(String text, String t) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black45,
        fontSize: 13,
        fontWeight: (t == "b") ? FontWeight.bold : FontWeight.normal),
  );
}

// dialog message display
 // ignore: non_constant_identifier_names
 DisplayAlertDialog(context,message,title) {
          MessageDialog messageDialog = MessageDialog(
                      dialogBackgroundColor: Colors.white,
                      buttonOkColor: primary,
                      title: title,
                      titleColor: Colors.black,
                      message: message,
                      messageColor: Colors.black,
                      buttonOkText: 'Ok',
                      dialogRadius: 15.0,
                      buttonRadius: 18.0,
                     );
                  messageDialog.show(context, barrierColor: Colors.white);
                  return messageDialog;

  }

Widget textFormWidget(String label, bool t, controller, type) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
          controller: controller,
          obscureText: (t) ? true : false,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
            ),
          ),
          validator: (value) {
             return validator(value!, type);
          }),
      Vspace(15.0),
    ],
  );
}

//email validation
String? isEmail(String string,) {
  // Null or empty string is invalid
  if (string.isEmpty) {
    return "Email field cannot be empty";
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return "Invalid Email";
  }
  return null;
}


//Field validation 
String? validator(String value, type){
  switch (type) {
    case "fname" :
          if (value.isEmpty) {  return "Name field cannot be empty";  }
           return null;     
    case "email" :
             return isEmail(value);   
    case "pass" :
          if (value.isEmpty) {  return "password field cannot be empty";  }
           return null;        
    default:
  }

}
