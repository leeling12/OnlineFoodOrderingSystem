import 'package:flutter/material.dart';
import 'package:bentayan/login/login.dart';
import 'manage_menu.dart';
import 'manage_order.dart';
import 'manage_promotion.dart';
import 'stall_order_history.dart';
import 'stall_homepage.dart';
import 'report.dart';

class StallOwnerLayout extends StatefulWidget {
  int _currentIndex;
  StallOwnerLayout(this._currentIndex);

  @override
  _StallOwnerLayout createState() => _StallOwnerLayout();
}

class _StallOwnerLayout extends State<StallOwnerLayout> {
  final List<Widget> _children = [
    StallHomePage(), //homepage 0
    OrderDetails(), //order 1
    ManageMenu(), //menu 2
    ManagePromotion(), //promotion 3
    StallOrderHistory(), //history 4
    DailyReport(), //5
    WeeklyReport(), //6
    MonthlyReport(), //7
  ];

  String title = "Store Name";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Scaffold(
              appBar: AppBar(
                title: Text(title),
                backgroundColor: Colors.red[900],
              ),

              //call function
              //body: Center(child: Text('My Page!')),
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
                        color: Colors.red[900],
                      ),
                    ),

                    ListTile(
                      title: Text('Homepage'),
                      leading: Icon(
                        Icons.home,
                      ),
                      onTap: () {
                        setState(() {
                          this.title = "Store Name";
                          widget._currentIndex = 0;
                        });
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      title: Text('Order Details'),
                      leading: Icon(
                        Icons.format_list_bulleted,
                      ),
                      onTap: () {
                        setState(() {
                          this.title = "Today's Order Details";
                          widget._currentIndex = 1;
                        });
                        Navigator.pop(context);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetails()));
                        //Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.restaurant_menu,
                      ),
                      title: Text('Menu'),
                      onTap: () {
                        setState(() {
                          this.title = "Menu";
                          widget._currentIndex = 2;
                        });
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.restaurant_menu,
                      ),
                      title: Text('Promotion'),
                      onTap: () {
                        setState(() {
                          this.title = "Promotion";
                          widget._currentIndex = 3;
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
                          this.title = "History";
                          widget._currentIndex = 4;
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


