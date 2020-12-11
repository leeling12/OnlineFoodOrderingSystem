
import 'package:flutter/material.dart';
import '../share_guest_member/cart.dart';

List<String> time = ["12:50 9/9/2020", "12:10 15/8/2020"];
class MemberOrderHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderHistory();
}

class _OrderHistory extends State<MemberOrderHistory> {

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          //key: _scaffoldKey,

          body:ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),

                    Container(
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(bottom: BorderSide(width: 1, color: Colors.blueGrey[100])),

                        ),
                        child:Column(
                          children: [
                            for(int i = 0; i < order.length; i++)
                              orderHistory(i, context),
                          ],
                        ),
                    ),


                    previousOrderHistory(0, context),

                  ],
                ),
              ]),
        ),
    );
  }

  Widget orderHistory(int i, BuildContext context) {

    return Column(
        children: [
          if(i == 0)
           Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("   Dine In" ,
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Spacer(),
                Text(time[0] + "  ",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),

              ],
            ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("  " + order[i].foodName + "   x " +
                  order[i].qty.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("  " + order[i].stallName + "  ",
                  style: TextStyle(fontSize: 14, color: Colors.black87)),
              Spacer(),
              Text("  " + order[i].price,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14,
                      color: Colors.black87)),
            ],
          ),

        ],
    );
  }

  Widget previousOrderHistory(int i, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.blueGrey[100])),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("   Dine In" ,
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Spacer(),
                Text(time[1] + "  ",
                    style: TextStyle(fontSize: 12, color: Colors.grey)),

              ],
            ),

          SizedBox(height: 10),

          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  " + order[0].foodName + "   x " +
                      "1",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  " + order[0].stallName + "  ",
                      style: TextStyle(fontSize: 14, color: Colors.black87)),
                  Spacer(),
                  Text("  " + "RM 10.00",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 14,
                          color: Colors.black87)),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }
}
