import 'package:bentayan/customer/guest/guest_layout.dart';
import 'package:bentayan/customer/member/member_layout.dart';
import 'package:flutter/material.dart';

import '../../module_class/order_promotion_module.dart';
import 'payment.dart';

List<OrderDetails> order = [
    OrderDetails(
      stallName: 'Stall 1',
      foodName: 'Chick. Chop',
      qty: 2,
      price: "RM 20.00",
      imgURL: 'lib/assets/images/stall1_pic1.jpg'

    ),
    OrderDetails(
        stallName: 'Stall 1',
        foodName: 'Fish Chop',
        qty: 1,
        price: "RM 12.50",
        imgURL: 'lib/assets/images/stall1_pic3.jpg'
    ),
    OrderDetails(
        stallName: 'Stall 2',
        foodName: 'Pann Mee',
        qty: 1,
        price: "RM 11.00",
        imgURL: 'lib/assets/images/stall2.jpg'
    ),
]; //OrderDetails(" Stall 1 ", {" Food 1"}, {0}, {" "}));

String subTotal = "RM  43.50";
bool isMember;

class Cart extends StatefulWidget {
  final bool isMember;

  Cart(this.isMember);

  @override
  State<StatefulWidget> createState() => OrderCart(isMember);
}


class OrderCart extends State<Cart> {
  String pageTitle = "CART";
  bool ismember;

  OrderCart(this.ismember);

  @override
  Widget build(BuildContext context) {
    isMember = ismember;
    return SafeArea(
        child: Scaffold(


          body:
          ListView.builder(
              itemCount: order.length,
              itemBuilder: (context, index) {
                return cartBody(index, context);
              }),
        )
    );
  }


  Widget cartBody(int i, BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.fromLTRB(30, 10, 30, 10),

        child: Column(
            children: <Widget>[
              if(i == 0)
                addOnBtn(),
              if(i == 0)
                SizedBox(height: 30),
              orderDetails(i),
              SizedBox(height: 15),
              seperateLine(),

              if(i == order.length - 1)
                orderSubTotal(context),
            ]
        )
    );
  }

  Widget orderDetails(int i) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.bottomLeft,
            child: new Image.asset(order[i].imgURL,
              height: 100, width: 100,
              fit: BoxFit.cover,
            ),
          ),

        ),

        Expanded(
          flex: 5,
          child:
          Column(
              children: <Widget>[
                Row(
                    children: <Widget>[
                      // Food's Name
                      Text(order[i].foodName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),

                      // Stall's Name
                      Text("  ( " + order[i].stallName + " )",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey),
                      )
                    ]),
                SizedBox(height: 10),
                if(isMember && i == 1)
                  Row(
                    // Stall's Name
                      children: <Widget>[
                        Text("Promotion : RM 2.00 is deducted",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                      ]
                  ),
                SizedBox(height: 40),
                Row(
                    children: <Widget>[
                      Text("Qty :  ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87),
                      ),
                      Icon(
                        Icons.indeterminate_check_box,
                        color: Colors.black26,
                        size: 18.0,
                      ),
                      Text("  " + order[i].qty.toString() + "  ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            backgroundColor: Colors.white),
                      ),
                      Icon(
                        Icons.add_box,
                        color: Colors.black26,
                        size: 18.0,
                      ),
                    ]
                ),

              ]
          ),

        ),
        Expanded(
          flex: 2,
          child:
          Text(order[i].price,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87),
          ),

        ),
        Expanded(
          flex: 1,
          child: Icon(
            Icons.delete,
            color: Colors.black26,
            size: 18.0,
          ),
        ),
      ],
    );
  }

  Widget addOnBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton.icon(
          onPressed: () {
            isMember
                ? Navigator.push(context,
                MaterialPageRoute(builder: (context) => MemberLayout(0)))
                : Navigator.push(context,
                MaterialPageRoute(builder: (context) => GuestLayout(0)));
          },
          color: Colors.amberAccent,
          icon: Icon(Icons.add, size: 18),
          label: Text(" Add On "),
        ),

      ],
    );
  }

  Widget orderSubTotal(BuildContext context) {
//subTotal
    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(" Subtotal :  " + subTotal,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),

        SizedBox(height: 30),
        paymentBtn(context),
      ],
    );
  }

  Widget paymentBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          onPressed:
              () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaymentPage()));
          },
          color: Colors.deepOrange,
          child: Text(
            " Proceed to Payment ", style: TextStyle(color: Colors.white),),
        ),

      ],
    );
  }
}

//---------- Draw Line ---------------//
Widget seperateLine() {
  return Container(
    height: 1,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black12,
      ),
    ),
  );
}