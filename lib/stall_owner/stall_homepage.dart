import 'package:bentayan/module_class/stall_module.dart';
import 'package:bentayan/stall_owner/manage_menu.dart';
import 'package:bentayan/stall_owner/manage_order.dart';
import 'package:bentayan/stall_owner/manage_promotion.dart';
import 'package:bentayan/stall_owner/stall_owner_layout.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:bentayan/customer/guest/customer_homepage.dart';
import 'manage_edit.dart';

StallModule stall = stallList[0];

class StallHomePage extends StatefulWidget {
  @override
  _StallHomePage createState() => _StallHomePage();
}

class _StallHomePage extends State<StallHomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _stallDetails(),
            _manage(),
            SizedBox(height: 5,),
            _report(),
      ],
    ));
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            "lib/assets/images/menu_icon.png",
            height: 55,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Homepage",
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ],
      ),
    );
  }

  Widget _manage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                "lib/assets/images/icon5.png",
                height: 38,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Manage",
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(1)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.deepOrange)),
                    child: Center(
                      child: Text(
                        "Order Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StallOwnerLayout(2)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.deepOrange)),
                    child: Center(
                      child: Text(
                        "Menu",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StallOwnerLayout(3)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.deepOrange)),
                    child: Center(
                      child: Text(
                        "Promotion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stallDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*Text(
            "Offers & Discounts",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(stall.img),
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.3),
                /* gradient: LinearGradient(
                  colors: [
                    //Color(0xFFFF961F).withOpacity(0.7),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                  ],
                ),*/
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    // Expanded(
                    //    child: Image.asset("lib/assets/images/stall1_pic1.jpg"),
                    // ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: stall.description + "\n",
                              //text: "Steak and Grills, Western \n",
                              style: TextStyle(fontSize: 16),
                            ),
                            TextSpan(
                              text: stall.stallName + "\n",
                              style: TextStyle(
                                fontSize: 43,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: stall.operatingHrs + "\n",
                              //"Operating Hours: Mon - Sun: 7:30 - 2:30 ",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _report() {
    double _height = 65;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                "lib/assets/images/report_icon.png",
                height: 35,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Report",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(5)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    height: _height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                       color: Colors.deepOrange,
                    ),
                    child: Center(
                      child: Text(
                        "Daily Report",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(6)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: double.infinity,
                    height: _height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange,
                    ),
                    child: Center(
                      child: Text(
                        "Weekly Report",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(7)));
                  },
                  child: Container(
                    //margin: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    height: _height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrange,
                    ),
                    child: Center(
                      child: Text(
                        "Monthly Report",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

_editDialog(BuildContext context, FoodModule food) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("EDIT"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height * 0.25);
                var width = MediaQuery.of(context).size.width;

                return Container(
                  height: height,
                  width: width - 50,
                  child: SingleChildScrollView(
                    child: MenuEditForm(food, 2),
                  ),
                );
              },
            ),
          ));
}

_successDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
            title: Text("Successfully Delete!"),
            actions: <Widget>[
              FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StallOwnerLayout(2)));
                },
              ),
            ],
          ));
}
