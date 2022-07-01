// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  //this function open and connect to database and return Database value
  var _db;
  var db;
  String path = "";
  

  // this function get databases path and return path as string
  Future<String> _getPathToDatabase() async {
    Directory databesesPath = await getApplicationDocumentsDirectory();
    String dbpath = join(databesesPath.path, "flash.db");
    // Check if the database exists
    bool exists = await databaseExists(dbpath);
    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");
      // Make sure the parent directory exists
      try {
        await Directory(dirname(dbpath)).create(recursive: true);
      } catch (_) {}
    }

    return dbpath;
  }

  //on create the database
  _onCreate(Database db, int version) async {
    // Database is created, create the table
    await db.execute(
      """CREATE TABLE user(
              id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
              name TEXT,
              email TEXT,
              phone TEXT,
              pass TEXT,
              created_at TEXT)""",
    );
  }

  // this function open the database and return database object
  Future<Database> _initDb() async {
    WidgetsFlutterBinding.ensureInitialized();
    path = await _getPathToDatabase();
    db ??= await openDatabase(path, version: 1, onCreate: _onCreate); 
    // return database object
    return db;
  }

  // this function checks if user has already registered before
  Future<bool> 
  _checkUserEmail(b) async {
    _db ??= await _initDb();
    List<Map<String, dynamic>> checkUser = await _db.query('user', where: "email= ?", whereArgs: [b]);
    return (checkUser.isNotEmpty) ? true : false;
  }
  
  // this function get the date now
  String _getDateNow () {
     String now = DateFormat("yyyy-MM-dd").format(DateTime.now());
     return now;
  }
    // this function register user
  Future<bool> register(a,b,c,d,) async {
    //date 
    String now = _getDateNow();
    // create map 
    Map<String, dynamic> map = {
        'name'  :  a,
        'email' :  b,
        'phone' :  c,
        'pass'  :  d,
        'created_at' : now,
    };
    //check user registered
    bool isResgister = await _checkUserEmail(b);
    // if user has already registered then return "true" else insert new user and return false
    if(isResgister){
         return isResgister;
    }
         _db ??= await _initDb();
         await _db.insert('user', map);
         return isResgister ;

  }

//login user
 Future<bool> loginUser(email, pass) async{
    _db ??= await _initDb();

     List<Map<String, dynamic>> checkUser = await _db.rawQuery(' SELECT * FROM user WHERE email = ? AND pass = ?', [email,pass] );

     if(checkUser.isNotEmpty){
          setUserDetails(checkUser[0]['name'], checkUser[0]['email']);
          return true;
     }

    return false;
}

//get user details
  setUserDetails(name, email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('name', name);
       prefs.setString('email', email);
       prefs.setBool('isLogin', true);
       return;
  }



  
}
