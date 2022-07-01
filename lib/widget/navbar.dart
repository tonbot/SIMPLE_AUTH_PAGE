 import 'package:authentication_001/constant/color/color.dart';
import 'package:flutter/material.dart';

 
Drawer drawer(String name, String email) {
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          UserAccountsDrawerHeader(
            decoration:BoxDecoration(
              color: primary,
            ),
            currentAccountPicture:  CircleAvatar(
              backgroundColor: white,
              child: const Icon(Icons.person,
              color: Colors.black,
               size: 60,
              ),
              maxRadius: 60.0,
            ),
      
            accountName: Text(name,
            // ignore: prefer_const_constructors
            style:TextStyle(
               color:Colors.black,
            )
           
            ),
            accountEmail: Text(email,
             // ignore: prefer_const_constructors
            style:TextStyle(
               color:Colors.black,
            )),
          ),
         
          const ListTile(
            leading: Icon(Icons.home_filled),
            title: Text("Home"),
          ),
           const Divider(),
            const ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Logout"),
          ),
           const Divider(),
        ],
      ),
    );
  }