// ignore_for_file: camel_case_types, constant_identifier_names, depend_on_referenced_packages, file_names

import 'dart:async';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/DataBase/Model/user_Model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database _db;

  static const String DB_Name = 'test.db';
  static const String Table_User = 'user';
  static const int Version = 1;

  static const String C_UserID = 'user_id';
  static const String C_UserName = 'user_name';
  static const String C_Email = 'email';
  static const String C_Mobile = 'mobile';
  static const String C_Age = 'age';
  static const String C_Password = 'password';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        " $C_UserID TEXT, "
        " $C_UserName TEXT, "
        " $C_Email TEXT,"
        " $C_Mobile TEXT,"
        " $C_Age TEXT,"
        " $C_Password TEXT, "
        " PRIMARY KEY ($C_UserID)"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel> getLoginUser(String userName, String password) async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserName = '$userName' AND "
        "$C_Password = '$password'");

    if (res.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_User, user.toMap(),
        where: '$C_UserName = ?', whereArgs: [user.user_name]);
    return res;
  }

  Future<int> deleteUser(String userName) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(Table_User, where: '$C_UserName = ?', whereArgs: [userName]);
    return res;
  }
}
