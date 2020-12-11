

import 'package:bentayan/module_class/stall_owner_module.dart';
import 'package:flutter/material.dart';


List<storeOwnerOrderDetails> orderDetails = [
  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Spaghetti Bolonese' ,
      foodImg: 'lib/assets/images/stall1_pic2.jpg', orderQty : 1,tableNum: 'A10',
      totalPrice: "RM 12.00",status: "Take Away",orderTime: "12:55 9/9/2020"
  ),
  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Chicken Chop' ,
      foodImg: 'lib/assets/images/stall1_pic1.jpg',orderQty : 2,tableNum: 'A15',
      totalPrice: "RM 20.00",status: "Dine In",orderTime: "12:50 9/9/2020"
  ),
  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Fish Chop' ,
      foodImg: 'lib/assets/images/stall1_pic3.jpg',orderQty : 1,tableNum: 'A15',
      totalPrice: "RM 12.50",status: "Dine In",orderTime: "12:50 9/9/2020"
  ),

  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Chicken Chop' ,
      foodImg: 'lib/assets/images/stall1_pic1.jpg', orderQty : 1,tableNum: 'A02',
      totalPrice: "RM 10.50",status: "Dine In",orderTime: "12:45 9/9/2020"
  ),
  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Spaghetti Bolonese' ,
      foodImg: 'lib/assets/images/stall1_pic2.jpg', orderQty : 2,tableNum: 'A28',
      totalPrice: "RM 24.00",status: "Dine In",orderTime: "12:43 9/9/2020"
  ),
  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Fish Chop' ,
      foodImg: 'lib/assets/images/stall1_pic3.jpg', orderQty : 1,tableNum: 'B05',
      totalPrice: "RM 12.50",status: "Take Away",orderTime: "12:42 9/9/2020"
  ),
  storeOwnerOrderDetails(
      stallName: 'Stall 1',foodName: 'Fish Chop' ,
      foodImg: 'lib/assets/images/stall1_pic3.jpg',orderQty : 2,tableNum: 'A18',
      totalPrice: "RM 25.00",status: "Dine In",orderTime: "12:30 9/9/2020"
  ),
];

List<IconData> doneIcon = new List<IconData>();// = Icons.done;
List<Color> buttonColor = new List<Color>(); // = Colors.orange;

class OrderDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OrderDetail();
}

class OrderDetail extends State<OrderDetails> {

  @override
  Widget build(BuildContext context) {
    for(int i = 0; i < orderDetails.length; i++){
        doneIcon.add(Icons.done);
        buttonColor.add(Colors.orange);
    }

    return ListView.builder(
              itemCount: orderDetails.length,
              itemBuilder: (context, index) {
                return orderDetail(index, context);
              }
    );
  }

  //header
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            "lib/assets/images/icon2.png",
            height: 55,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            "Order Details",
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ],
      ),
    );
  }


  Widget orderDetail(int i, BuildContext context) {
    if (i != 0 && orderDetails[i].tableNum == orderDetails[i - 1].tableNum)
      return Container();

    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(left: 30, right: 30),

      child: Column(
        children: [
          if(i == 0)
            cardBox(context, i),

          if(i != 0)
            if(orderDetails[i].tableNum != orderDetails[i - 1].tableNum)
            cardBox(context, i),

        ],
      ),

    );
  }

  Widget cardBox(BuildContext context, int i) {

    return Column(
        children: <Widget>[
          if(i == 0)
            editBtn(context),

          if(i == 0)
            SizedBox(height: 20),

          Container(
            width: double.maxFinite,
            //height: 120,
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("   " + orderDetails[i].orderTime,
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                        Spacer(),
                        Text("Table " + orderDetails[i].tableNum + "  ",
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),

                    SizedBox(height: 3),
                    displayOrderDetails(i),

                      if(i != orderDetails.length - 1 && orderDetails[i].tableNum == orderDetails[i + 1].tableNum)
                        displayOrderDetails(i + 1),

                    SizedBox(height: 8),
                    doneBtn(context, i),
                  ],
                ),

              ),
            ),
            // Food's Name
          ),

        ]
    );
  }


  Widget displayOrderDetails(int i) {
    return Column(
      children: [
        if(i != 0 && orderDetails[i].tableNum == orderDetails[i - 1].tableNum)
          SizedBox(height: 15),

        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("  " + orderDetails[i].foodName + "   x " +
                orderDetails[i].orderQty.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("  " + orderDetails[i].totalPrice,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16,
                    color: Colors.black87)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("  " + orderDetails[i].status + "  ",
                style: TextStyle(fontSize: 16, color: Colors.black87)),
          ],
        ),
      ],
    );
  }

  String textEditBtn = "Edit";
  IconData iconEditBtn = Icons.edit;
  Widget editBtn(BuildContext context) {
    return Stack(
      children: [
        _header(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton.icon(
              onPressed: () {
                if(textEditBtn == "Edit"){
                  setState(() {
                    textEditBtn = "Back";
                    iconEditBtn = Icons.arrow_back_ios;
                    for(int i = 0; i < orderDetails.length; i++){
                      if(doneIcon[i] != Icons.done_all && doneIcon[i] != Icons.delete){
                        doneIcon[i] = Icons.delete_outline;
                        buttonColor[i] = Colors.red;
                      }
                    }

                  });
                }else{
                  setState(() {
                    textEditBtn = "Edit";
                    iconEditBtn = Icons.edit;
                    for(int i = 0; i < orderDetails.length; i++) {
                      if (doneIcon[i] != Icons.done_all && doneIcon[i] != Icons.delete) {
                        doneIcon[i] = Icons.done;
                        buttonColor[i] = Colors.orange;
                      }
                    }
                  });
                }

              },
              color: Colors.green,
              icon: Icon(iconEditBtn, size: 18, color: Colors.white,),
              label: Text(textEditBtn, style: TextStyle(color: Colors.white),),
            ),

          ],
        ),
      ],
    );
  }

  Widget doneBtn(BuildContext context, int i){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          onPressed: (){
            if(doneIcon[i] != Icons.done_all && doneIcon[i] != Icons.delete){
              showDialog(
                //Confirmation Message
                context: context,
                builder: (BuildContext context) =>
                       new AlertDialog(
                                title: doneIcon[i] == Icons.done? Text("Confirm Done?"): Text("Confirm Delete?"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: doneIcon[i] == Icons.done? new Text('No', style: TextStyle(color: Colors.red)):new Text('No'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FlatButton(
                                    child: doneIcon[i] == Icons.done? new Text('Yes'): new Text('Yes', style: TextStyle(color: Colors.red)),
                                    onPressed: () {
                                      if(doneIcon[i] == Icons.done){
                                        setState(() {
                                          doneIcon[i] = Icons.done_all;
                                          buttonColor[i] = Colors.grey;
                                        });
                                      }else{
                                        setState(() {
                                          doneIcon[i] = Icons.delete;
                                          buttonColor[i] = Colors.grey;
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              )
                          );
            }
          },
          icon: Icon(doneIcon[i], size: 20, color: buttonColor[i],),
        ),

      ],
    );
  }

}

