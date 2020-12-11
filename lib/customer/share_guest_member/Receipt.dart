
import 'package:bentayan/customer/guest/guest_layout.dart';
import 'package:bentayan/customer/member/member_layout.dart';
import 'package:flutter/material.dart';
import 'payment.dart';
import 'cart.dart';

class receipt extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(

            title: new Center(child:
              new Text("Receipts",
              style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
            backgroundColor: Colors
                .cyan[800],// Color.fromRGBO(146, 170, 170, 100),
            actions: [
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  showDialog(
                    //Confirmation Message
                    context: context,
                    builder: (BuildContext context) => new proceedMessage(),
                  );
                },
              ),
            ],
          ),
          body: ListView(
              children: [
                receiptContent(),
              ]),
        )
    );

  }

  Widget receiptContent(){
    return Container(
      margin: const EdgeInsets.fromLTRB(60.0, 50, 60, 60),
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),

      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Bentayan Food Court", style: TextStyle(color: Colors.blueAccent, fontSize: 15),),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Jalan Bakri, Taman Sri Emas, 84000 Muar, Johor, Malaysia", style: TextStyle(color: Colors.grey, fontSize: 11),),
            ],
          ),

          SizedBox(height: 20),

          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("9/9/2020 13:05", style: TextStyle(color: Colors.grey, fontSize: 12),),
              Spacer(),
              Text("B10083", style: TextStyle(color: Colors.grey, fontSize: 12),),
            ],
          ),

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Qty  Description", style: TextStyle(color: Colors.black87, fontSize: 14),),
              Spacer(),
              Text("Amount", style: TextStyle(color: Colors.black87, fontSize: 13),),
            ],
          ),


          SizedBox(height: 15),
          for(int i = 0; i < order.length; i++)
            orderDetails(i),

          SizedBox(height: 20),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          pricingDetails(),

          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Thank You !", style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),

          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Please Come Again !", style: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget orderDetails(int i) {
    return Column(
          children: <Widget>[
                 Row(
                      children: <Widget>[
                        // Food's Name
                        Text(
                            order[i].qty.toString() + "       " + order[i].foodName,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 13 )),

                        // Stall's Name
                        Text(" (" + order[i].stallName + ") ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey),
                        ),
                        Spacer(),
                        Text(order[i].price,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87),
                        ),
                      ]),

            if(isMember && i == 1)
              SizedBox(height: 4),

            if(isMember && i == 1)
              Row(
                // Stall's Name
                  children: <Widget>[
                    Text("           Promotion : - RM 2.00",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey),
                    ),
                  ]
              ),
            SizedBox(height: 8),


          ],

    );
  }

  Widget pricingDetails() {
    return Column(
        children: [
          if(isMember)
            SizedBox(height: 10),
          // Total Discount
          if(isMember)
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text("   Discount ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13,
                         // fontWeight: FontWeight.bold
                      )),
                ),
                Expanded(
                  flex: 2,
                  child: Text(":",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold
                      )),
                ),

                Expanded(
                  flex: 6,
                  child: Text("RM    2.00",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 13,
                          //fontWeight: FontWeight.bold
                      )),
                ),

              ],
            ),

          SizedBox(height: 10),
          // Subtotal
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("   Subtotal ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.bold
                    )),
              ),
              Expanded(
                flex: 2,
                child: Text(":",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.bold
                    )),
              ),

              Expanded(
                flex: 6,
                child: Text(subTotal,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.bold
                    )),
              ),

            ],
          ),
          SizedBox(height: 10),
          // Total Tax
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("   Tax ( 6% )",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.bold
                    )),
              ),
              Expanded(
                flex: 2,
                child: Text(":",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.bold
                    )),
              ),

              Expanded(
                flex: 6,
                child: Text(tax,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 13,
                        //fontWeight: FontWeight.bold
                    )),
              ),

            ],
          ),

          SizedBox(height: 10),
          // Total Payment
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("   Total",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 2,
                child: Text(":",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
              ),

              Expanded(
                flex: 6,
                child: Text(totalPayment,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
              ),

            ],
          ),

        ],

    );
  }



}

// --- proceed to menu page ---//
class proceedMessage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      content: Builder(
        builder: (context){
          var width = MediaQuery.of(context).size.width;

          return Container(
              height: 150,
              width: width - 75,

              //------- Notification Details Page Layout -------//
              child: ListView(
                children: <Widget>[
                  //------- close/back icon -------//
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      closeMessageIcon(context),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Press 'OK' to continue proceed to main menu. "),
                    ],
                  ),

                  SizedBox(height: 20),
                  okBtnMember(context),

                ],
              )

          );
        },
      ),

    );
  }

  Widget okBtnMember(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: new MaterialButton(
        color: Colors.blue, //Colors.white,
        child: Text(" OK ", style: TextStyle(color: Colors.white)),
        onPressed: (){
          //back to main menu page
          if(isMember){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MemberLayout(0)));
          }else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => GuestLayout(0)));
          }
        },
      ),

    );

  }
}

// icon that can close the pop out window
Widget closeMessageIcon(BuildContext context) {
  return Container(
    child: Center(
      child:IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.grey,
          size: 20,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
  );
}
