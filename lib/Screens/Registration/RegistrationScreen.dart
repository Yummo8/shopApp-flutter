// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print, library_private_types_in_public_api, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/DataBase/DB_Helper/databse_Helper.dart';
import 'package:shopping_app/DataBase/Model/user_Model.dart';
import 'package:shopping_app/Screens/Login/LoginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _passwordVisible = false;
  bool _passVisible = false;

  final _formKey = GlobalKey<FormState>();

  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conMobile = TextEditingController();
  final _conAge = TextEditingController();
  final _conPassword = TextEditingController();
  final _conCPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    _passwordVisible = false;
    _passVisible = false;
  }

  signUp() async {
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String mobile = _conMobile.text;
    String age = _conAge.text;
    String passwd = _conPassword.text;
    String cpasswd = _conCPassword.text;

    if (_formKey.currentState.validate()) {
      if (passwd != cpasswd ||
          uname.isEmpty ||
          email.isEmpty ||
          mobile.isEmpty ||
          age.isEmpty) {
        // Toast.show('Password Mismatch', context);
        Fluttertoast.showToast(msg: 'Password Mismatch');
      } else {
        _formKey.currentState.save();

        UserModel uModel = UserModel(uname, email, mobile, age, passwd);
        await dbHelper.saveData(uModel).then((UserData) {
           // Toast.show("Successfully Saved",context);
          Fluttertoast.showToast(msg: 'Successfully Saved');

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoginScreen()));
        }).catchError((error) {
          print(error);
          //Toast.values("Error: Data Save Fail",context);
          Fluttertoast.showToast(msg: 'Error: Data Save Fail');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenHeight,
        width: screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1498335746477-0c73d7353a07?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTcyfHxiYWNrZ3JvdW5kJTIwZGVzaWdufGVufDB8MXwwfHw%3D&auto=format&fit=crop&w=500&q=60"))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(height: screenHeight * .10),
                Center(
                  child: Text(
                    'Registration',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
                SizedBox(height: screenHeight * .03),
                Text(
                  'Sign Up To Get Started',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                SizedBox(height: screenHeight * .02),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "I'm Already A Member!",
                            style: TextStyle(
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                SizedBox(height: screenHeight * .02),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _conUserName,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _conEmail,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                TextFormField(
                  maxLength: 10,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[0-9]'),
                        allow: true)
                  ],
                  cursorColor: Colors.black,
                  controller: _conMobile,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                TextFormField(
                  maxLength: 2,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[0-9]'),
                        allow: true)
                  ],
                  cursorColor: Colors.black,
                  controller: _conAge,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z0-9]'),
                        allow: true)
                  ],
                  cursorColor: Colors.black,
                  controller: _conPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    labelText: 'Create A Passcode',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                  obscureText: !_passwordVisible,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: screenHeight * .02),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _conCPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          _passVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black),
                      onPressed: () {
                        setState(() {
                          _passVisible = !_passVisible;
                        });
                      },
                    ),
                    labelText: 'Confirm Your Passcode',
                    labelStyle: TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                  ),
                  obscureText: !_passVisible,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: screenHeight * .06),
                ElevatedButton(
                  onPressed: signUp,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 4,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
