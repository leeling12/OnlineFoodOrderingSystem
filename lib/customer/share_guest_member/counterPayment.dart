
import 'package:bentayan/customer/guest/guest_layout.dart';
import 'package:bentayan/customer/member/member_layout.dart';
import 'package:flutter/material.dart';

bool ismember;

class CounterPayment extends StatelessWidget {

  bool isMember;

  CounterPayment(this.isMember);

  @override
  Widget build(BuildContext context) {
    ismember = isMember;
    return AlertDialog(
      content: Builder(
        builder: (context){
          var width = MediaQuery.of(context).size.width;

          return Container(
              height: 400,
              width: width - 20,

              //------- Payments Details Page Layout -------//
              child: ListView(
                children: <Widget>[
                  paymentDetailsMessage(context),
                  SizedBox(height: 10),
                  displayQRCode(),
                  SizedBox(height: 40),
                  doneBtn(context),
                ],
              )

          );
        },
      ),

    );

  }

  //------ Pay at counter message ------//
 Widget paymentDetailsMessage(BuildContext context){

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        //------- close/back icon -------//
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            closeMessageIcon(context),
          ],
        ),

        //------- Page Title -------//
        Text(
          "Pls proceed to counter for making payment.",
          style: TextStyle( fontSize: 20),
        ),

          SizedBox(height: 10),

          Text("**Only click 'Done' when cashier has scanned the QR code.",
            style: TextStyle( fontSize: 12, color: Colors.black54),
          ),
          SizedBox(height: 20),

        ],
      ),
    );

  }

  Widget displayQRCode(){
    return Container(
      child: new Image.asset('lib/assets/images/QRCode.jpg',
        height: 150, width: 150,
      ),

    );
  }

  Widget doneBtn(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: new MaterialButton(
          color: Colors.blue, //Colors.white,
          child: Text(" Done ", style: TextStyle(color: Colors.white)),
          onPressed: (){
            showDialog(
              //Confirmation Message
              context: context,
              builder: (BuildContext context) => new proceedMessage(),
            );
          },
      ),

    );

  }

}

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
                  okBtn(context),

                ],
              )

          );
        },
      ),

    );
  }

  Widget okBtn(BuildContext context){
    return Container(
      alignment: Alignment.center,
      child: new MaterialButton(
        color: Colors.blue, //Colors.white,
        child: Text(" OK ", style: TextStyle(color: Colors.white)),
        onPressed: (){
          //back to main menu page
          if(ismember){
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
