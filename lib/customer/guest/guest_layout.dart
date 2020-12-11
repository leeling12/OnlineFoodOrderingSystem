import 'package:flutter/material.dart';

import '../share_guest_member/cart.dart';
import 'package:bentayan/login/register.dart';
import 'package:bentayan/login/login_member.dart';
import 'customer_homepage.dart';
import 'package:bentayan/customer/menu.dart';

bool ismember = false;

class GuestLayout extends StatefulWidget {
  int _currentIndex;
  GuestLayout(this._currentIndex);

  @override
  _GuestLayout createState() => _GuestLayout();
}

class _GuestLayout extends State<GuestLayout> {
  final List<Widget> _children = [
    CustomerHomePage(), //homepage 0
    Cart(ismember), //order 1
  ];

  String title = "Bentayan Food Court";
  int page = 1;
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
              //body: Menu(),
              //body: CustomerHomePage(),
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
                      },
                    ),

                    ListTile(
                      title: Divider(color: Colors.black,height: 5,thickness: 1,),
                    ),

                    ListTile(
                      title: Text('Sign in'),
                      leading: Icon(
                        Icons.person,
                      ),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MemberLogin()));
                      },
                    ),
                    ListTile(
                      title: Text('Register'),
                      leading: Icon(
                        Icons.edit,
                      ),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterForm()));
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


