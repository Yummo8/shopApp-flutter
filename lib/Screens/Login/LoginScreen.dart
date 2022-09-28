// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_final_fields, file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/DataBase/DB_Helper/databse_Helper.dart';
import 'package:shopping_app/DataBase/Model/user_Model.dart';
import 'package:shopping_app/Screens/HomePage/HomePage.dart';
import 'package:shopping_app/Screens/Login/LoginSuccess.dart';
import 'package:shopping_app/Screens/Registration/RegistrationScreen.dart';

String name='';
String email='';
String photo='';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _passwordVisible = false;

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final _formKey = GlobalKey<FormState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    _passwordVisible = false;
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      // Toast.show("Please Enter User ID", context);
      Fluttertoast.showToast(msg: 'Please Enter User ID');
    } else if (passwd.isEmpty) {
      // Toast.show("Please Enter Password", context);
      Fluttertoast.showToast(msg: 'Please Enter Password');
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginSuccess()),
                (Route<dynamic> route) => false);
          });
        } else {
          // Toast.show("Error: User Not Found", context);
          Fluttertoast.showToast(msg: 'Error: User Not Found');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
        // Toast.show("Error: Login Fail", context);
        Fluttertoast.showToast(msg: 'Error: Login Fail');
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    // sp.setString("user_id", user.user_id!);
    sp.setString("user_name", user.user_name);
    sp.setString("email", user.email);
    sp.setString("mobile", user.mobile);
    sp.setString("age", user.age);
    sp.setString("password", user.password);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    // return
      await FirebaseAuth.instance.signInWithCredential(credential);
      name=googleUser.displayName;
      email=googleUser.email;
      photo=googleUser.photoUrl;


   return Get.to(()=> HomePage());
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
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
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [
                SizedBox(height: screenHeight * .10),
                Center(
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
                SizedBox(height: screenHeight * .03),
                Text(
                  'Login To Continue',
                  style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(height: screenHeight * .01),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: 'I Am New Here!',
                            style: TextStyle(
                              letterSpacing: 4,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87.withOpacity(0.6),
                            ))),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegistrationScreen()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        )),
                  ],
                ),
                SizedBox(height: screenHeight * .1),
                TextFormField(
                  cursorColor: Colors.black,
                  controller: _conUserId,
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
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp(r'[a-zA-Z0-9]'),
                        allow: true)
                  ],
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
                    labelText: 'Passcode',
                    hintText: '* * * * * * * *',
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
                  textInputAction: TextInputAction.done,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password!",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * .01,
                              horizontal: screenHeight * .03),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: signInWithFacebook,
                        child: Row(
                          children: [
                            Image.network(
                                'https://img.icons8.com/fluency/2x/facebook-new.png',
                                height: 25,
                                width: 25),
                            Text("Facebook",
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * .01,
                              horizontal: screenHeight * .03),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        // onPressed: ()async{
                        //   signInWithGoogle(model)
                        //       .then((FirebaseUser user){
                        //     model.clearAllModels();
                        //     Navigator.of(context).pushNamedAndRemoveUntil
                        //       (RouteName.Home, (Route<dynamic> route) => false
                        //     );}
                        //   ).catchError((e) => print(e));
                        // },
                        onPressed: signInWithGoogle,
                        // onPressed: () {},
                        child: Row(
                          children: [
                            Image.network(
                                "https://img.icons8.com/color/2x/google-logo.png",
                                height: 25,
                                width: 25),
                            Text("Google",
                                style: TextStyle(color: Colors.black)),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: screenHeight * .030),
                ElevatedButton(
                  onPressed: login,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black45,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * .02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Login',
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
