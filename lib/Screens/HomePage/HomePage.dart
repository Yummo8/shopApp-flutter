// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_string_interpolations, prefer_final_fields, camel_case_types, unnecessary_new, file_names, invalid_use_of_visible_for_testing_member

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/DataBase/DB_Helper/databse_Helper.dart';
import 'package:shopping_app/DataBase/Model/user_Model.dart';
import 'package:shopping_app/Screens/CartScreen/Cart.dart';
import 'package:shopping_app/Screens/BottomBar/Categories.dart';
import 'package:shopping_app/Screens/BottomBar/Profile.dart';
import 'package:shopping_app/Screens/DrawerScreens/MyOrders.dart';
import 'package:shopping_app/Screens/DrawerScreens/MyRewards.dart';
import 'package:shopping_app/Screens/DrawerScreens/Notification.dart';
import 'package:shopping_app/Screens/DrawerScreens/PrivacyPolicy.dart';
import 'package:shopping_app/Screens/Login/LoginScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  DbHelper dbHelper;
  final _conDelUserId = TextEditingController();
  final _conUserName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conMobile = TextEditingController();
  final _conAge = TextEditingController();
  final _conPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
    dbHelper = DbHelper();
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;

    setState(() {
      // _conUserId.text = sp.getString("user_id")!;
      _conDelUserId.text = sp.getString("user_name");
      _conUserName.text = sp.getString("user_name");
      _conEmail.text = sp.getString("email");
      _conMobile.text = sp.getString("mobile");
      _conAge.text = sp.getString("age");
      _conPassword.text = sp.getString("password");
    });
  }

  update() async {
    // String uid = _conUserId.text;
    String uname = _conUserName.text;
    String email = _conEmail.text;
    String mobile = _conMobile.text;
    String age = _conAge.text;
    String passwd = _conPassword.text;

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      UserModel user = UserModel(uname, email, mobile, age, passwd);
      await dbHelper.updateUser(user).then((value) {
        if (value == 1) {
          //   Toast.show("Successfully Updated",context);
          Fluttertoast.showToast(msg: 'Successfully Updated');

          updateSP(user, true).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (Route<dynamic> route) => false);
          });
        } else {
          // Toast.show("Error Update",context);
          Fluttertoast.showToast(msg: 'Error Update');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print(error);
        }
        //Toast.show("Error",context);
        Fluttertoast.showToast(msg: 'Error');
      });
    }
  }

  delete() async {
    String delUserID = _conDelUserId.text;

    await dbHelper.deleteUser(delUserID).then((value) {
      if (value == 1) {
        // Toast.show("Successfully Deleted",context);
        Fluttertoast.showToast(
            msg: "${_conUserName.text}, Successfully Deleted");

        updateSP(
                UserModel(
                    /*_conUserId.text,*/
                    _conUserName.text,
                    _conEmail.text,
                    _conMobile.text,
                    _conAge.text,
                    _conPassword.text),
                false)
            .whenComplete(() {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
              (Route<dynamic> route) => false);
        });
      }
    });
  }

  Future updateSP(UserModel user, bool add) async {
    final SharedPreferences sp = await _pref;

    if (add) {
      sp.setString("user_name", user.user_name);
      sp.setString("email", user.email);
      sp.setString("mobile", user.mobile);
      sp.setString("age", user.age);
      sp.setString("password", user.password);
    } else {
      sp.remove('user_id');
      sp.remove('user_name');
      sp.remove('email');
      sp.remove('mobile');
      sp.remove('age');
      sp.remove('password');
    }
  }

// banner
  buildItem(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      child: Padding(
        padding: EdgeInsets.only(left: 2, right: 2, top: 3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image.asset(
            "assets/Images/banner_one.png",
            height: MediaQuery.of(context).size.height / 4,
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> deal = [
    {
      'imageUrl': "assets/Images/female.png",
      'name': "Dresses & Tops",
      'discount': "From \u{20B9}99"
    },
    {
      'imageUrl': "assets/Images/watch.png",
      'name': "Watches",
      'discount': "Upto 70%off"
    },
    {
      'imageUrl': "assets/Images/male_modle.png",
      'name': "T-Shirts",
      'discount': "Starting \u{20B9}99"
    },
    {
      'imageUrl': "assets/Images/shirt_modle.png",
      'name': "Causal Shirts",
      'discount': "Extra \u{20B9}100 off"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
              onPressed: () {
                // method to show the search bar
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: SvgPicture.asset('assets/Images/Search.svg')),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 0),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: SvgPicture.asset('assets/Images/shopping bag.svg')),
        ],
        title: SvgPicture.asset('assets/Images/Logo.svg', width: 120),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black87,
        elevation: 0.0,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black45),
              accountName: Text(_conUserName.text),
              accountEmail: Text(_conEmail.text),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.grey
                        : Colors.white,
                child: Image.asset('assets/Images/icons8-person-96.png',
                    height: 40, width: 40),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrder()));
              },
              leading: Image.asset('assets/Images/icons8-purchase-order-60.png',
                  height: 30, width: 30, color: Colors.white),
              title: Text("My Orders",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 20),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyRewards()));
              },
              leading: Image.asset(
                'assets/Images/icons8-gift-60.png',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
              title: Text("My Rewards",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 20),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notificationsss()));
              },
              leading: Image.asset(
                'assets/Images/icons8-notification-50.png',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
              title: Text("Notification",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 20),
            ),
            // ListTile(
            //   onTap: () {
            //     // LanguagePickerUtils();
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => LanguagePickerDropdown(
            //                   onValuePicked: (Language value) {},
            //                   itemBuilder: (Language language) {
            //                     return build(context);
            //                   },
            //                   initialValue: '',
            //                   languagesList: [],
            //                 )));
            //   },
            //   leading: Icon(
            //     Icons.language,
            //     size: 30,
            //     color: Colors.white,
            //   ),
            //   title: Text("Language",
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.w600,
            //           fontSize: 18)),
            //   trailing: Icon(Icons.keyboard_arrow_right,
            //       size: 20, color: Colors.white),
            // ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
              },
              leading: Icon(
                Icons.privacy_tip,
                size: 30,
                color: Colors.white,
              ),
              title: Text("Privacy Policy",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: 3)
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Home',
              enableFeedback: false,
              onPressed: () {
                context;
              },
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
              tooltip: 'Categories',
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Categories()));
              },
              icon: Icon(
                Icons.apps,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
              tooltip: 'Cart',
              enableFeedback: false,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 30,
              ),
            ),
            IconButton(
              tooltip: 'Profile',
              enableFeedback: false,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    constraints: BoxConstraints.expand(height: 150),
                    child: imageSlider(context)),
              ),
              Container(
                height: size.height / 5,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Image.asset("assets/Images/telivision.png"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Image.asset("assets/Images/running.png"),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Image.asset("assets/Images/mobile_top.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height / 1.6,
                child: Stack(
                  children: [
                    Container(
                      height: size.height / 1.7,
                      color: Color(0xffFFBAF0),
                    ),
                    Container(
                      height: size.height / 7,
                      width: size.width,
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        "assets/Images/banner_three.png",
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height / 65,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Deals of the Day',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '19h 18m Remaining',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('View All'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            width: size.width,
                          ),
                          Container(
                            height: size.height / 1.75,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            width: size.width,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              child: GridView.builder(
                                padding: EdgeInsets.all(10),
                                itemCount: deal.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6.5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        child: Image.asset(
                                            deal[index]['imageUrl']),
                                      ),
                                      Text(
                                        '${deal[index]['name']}',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 2),
                                        child: Text(
                                          '${deal[index]['discount']}',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 2.45,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, bottom: 8, top: 8),
                        child: Text(
                          'Featured Brand',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 8),
                        child: Text(
                          'Sponsored',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Image.asset(
                        "assets/Images/power_bank.png",
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Image.asset("assets/Images/hair_dryer.png"),
                    ),
                    Expanded(
                      child: Image.asset("assets/Images/laptop.png"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Swiper imageSlider(context) {
  return Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return Image.asset('assets/Images/banner_one.png');
    },
    itemCount: 5,
    viewportFraction: 0.7,
    scale: 0.8,
  );
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Shoes",
    "Watch",
    "Iphone 13 Pro Max",
    "I watch",
    "Airbuds",
    "Clothes",
    "Laptop",
    "Glasses"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
