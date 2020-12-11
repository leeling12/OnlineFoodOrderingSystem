
import 'package:flutter/material.dart';

import 'manage_order.dart';

class StallOrderHistory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderHistory();
}

class _OrderHistory extends State<StallOrderHistory> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: orderDetails.length,
        itemBuilder: (context, index) {
          return orderDetail(index, context);
        }
    );
  }

  Widget orderDetail(int i, BuildContext context) {
    if (i != 0 && orderDetails[i].tableNum == orderDetails[i - 1].tableNum)
      return Container();

    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        border:
        Border(bottom: BorderSide(width: 1, color: Colors.blueGrey[100])),
        color: Colors.white,
      ),
      child: Column(
        children: [
          if(i == 0 || (i != 0 && orderDetails[i].tableNum != orderDetails[i - 1].tableNum))
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

          SizedBox(height: 10),


          if(i == 0 )
            historyDetails(context,i),

          if( i != 0 && orderDetails[i].tableNum != orderDetails[i - 1].tableNum)
            historyDetails(context,i),

            if(i != orderDetails.length - 1 && orderDetails[i].tableNum == orderDetails[i + 1].tableNum)
              Column(
                children: [
                  SizedBox(height: 20),
                  historyDetails(context,i+1),
                ],
              ),
        ],
      ),
    );
  }

  Widget historyDetails(BuildContext context, int i) {

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("  " + orderDetails[i].foodName + "   x " +
                orderDetails[i].orderQty.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("   " + orderDetails[i].status + "  ",
                style: TextStyle(fontSize: 14, color: Colors.black87)),
            Spacer(),
            Text("  " + orderDetails[i].totalPrice,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14,
                    color: Colors.black87)),
          ],
        ),

      ],
    );

  }

}
