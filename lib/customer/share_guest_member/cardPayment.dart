
import 'Receipt.dart';
import 'payment.dart';
import 'package:flutter/material.dart';

class CardPayment extends StatelessWidget {

  TextEditingController otpController = TextEditingController();
  final _otpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //------- close/back icon -------//
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              closeMessageIcon(context),
            ],
          ),
          Form(
            key: _otpKey,
            child: TextFormField(//TextField(
              controller: otpController,
              decoration: InputDecoration(
                labelText: 'OTP Code',
              ),
              validator: (value) {
                if (value.isEmpty || value.length !=6) {
                  return "*Invalid OTP Code";
                } else {
                  return null;
                }
              },

            ),
          ),
          resend(),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 70.0, bottom: 10),
          child: MaterialButton(
            minWidth: 120,
            elevation: 5.0,
            color: Colors.blue,
            child: Text("Submit",style: TextStyle(color: Colors.white)),
            onPressed: (){
              if(_otpKey.currentState.validate()){

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => receipt()), ModalRoute.withName(''));

              }
              //
            },
          ),
        ),

      ],
    );

  }

  Widget resend(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(

          child: Text("Resend OTP",style: TextStyle(fontSize: 12, color: Colors.blue)),
          onPressed: (){
         },
        ),
      ],
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

