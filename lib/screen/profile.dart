import 'package:authentication_001/constant/color/color.dart';
import 'package:authentication_001/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
    
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // ignore: prefer_typing_uninitialized_variables
  var isLogin;
  //get name from 
   String name= ""; 
   String email = "";
  

   @override
  initState() {        
    super.initState(); 
    getUserDetails();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        elevation: 0,
        title: const Text("Profile"),
      ),
      drawer: drawer(name,email),
      body: const Center(child: Text("WELCOME")),
    );
  }

 


 
  //get user details
  getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //check if user login
    isLogin = prefs.getBool('isLogin') ?? false;
    // if islogin set name and email else return to login
    if (isLogin){
      setState(() {
        name = prefs.getString('name').toString();
        email = prefs.getString('email').toString();
     
      });
          return;
    }

     print("user not logged in");
  }






}
