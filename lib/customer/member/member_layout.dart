import 'member_order_history.dart';
import 'member_profile.dart';
import 'promotion.dart';
import 'package:flutter/material.dart';
import 'package:bentayan/login/login.dart';
import 'member_homepage.dart';

import '../share_guest_member/cart.dart';
import 'rating.dart';

bool ismember = true;

class MemberLayout extends StatefulWidget {
  int _currentIndex;
  MemberLayout(this._currentIndex);

  @override
  _MemberLayout createState() => _MemberLayout();
}

class _MemberLayout extends State<MemberLayout> {
  final List<Widget> _children = [
    MemberHomePage(), //homepage 0
    Cart(ismember), //order 1
    Promotion(), //2
    MemberOrderHistory(), //3
    Rating(), //4
    MemberProfile(), //5
  ];

  String title = "Bentayan Food Court";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Scaffold(
              appBar: AppBar(
                title: Text(title),
                backgroundColor: Colors.cyan[800],
              ),

              //call function
              //body: MemberHomePage(),
              body: _children[widget._currentIndex],

              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: new GestureDetector(
                        child: new Text(
                          "Welcome to Bentayan Food Court!",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.cyan[800],
                      ),
                    ),

                    ListTile(
                      title: Text('Homepage'),
                      leading: Icon(
                        Icons.home,
                      ),
                      onTap: () {
                        setState(() {
                          widget._currentIndex = 0;
                          this.title = "Bentayan Food Court";
                        });
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                      ),
                      title: Text('Cart'),
                      onTap: () {
                        setState(() {
                          widget._currentIndex = 1;
                          this.title = "Cart";
                        });
                        Navigator.pop(context);
                        //Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      title: Text('Promotion'),
                      leading: Icon(
                        Icons.shop,
                      ),
                      onTap: () {
                        setState(() {
                          widget._currentIndex = 2;
                          this.title = "Promotion";
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('History'),
                      leading: Icon(
                        Icons.history,
                      ),
                      onTap: () {
                        setState(() {
                          widget._currentIndex = 3;
                          this.title = "History";
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Rating'),
                      leading: Icon(
                        Icons.rate_review,
                      ),
                      onTap: () {
                        setState(() {
                          widget._currentIndex = 4;
                          this.title = "Rating";
                        });
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      title: Text('Profile'),
                      leading: Icon(
                        Icons.account_circle,
                      ),
                      onTap: () {
                        setState(() {
                          widget._currentIndex = 5;
                          this.title = "Profile";
                        });
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      title: Text('Sign Out'),
                      leading: Icon(
                        Icons.exit_to_app,
                      ),
                      onTap: () {
                        return showDialog(
                          context: context,
                          //barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title:
                              Text("Press 'OK' to confirm logout!"),
                              actions: <Widget>[
                                FlatButton(
                                  child: new Text('OK'),
                                  onPressed: () {
                                    //logOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ), (route) {
                                      return route == null;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),

                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}


