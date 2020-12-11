
import 'package:flutter/material.dart';

class EditMemberProfile extends StatelessWidget {
  String title;
  TextEditingController strController = TextEditingController();
  TextEditingController strController1 = TextEditingController();
  TextEditingController strController2 = TextEditingController();

  final _otpKey = GlobalKey<FormState>();
  final _otpKey1 = GlobalKey<FormState>();
  final _otpKey2 = GlobalKey<FormState>();
  final _otpKey3 = GlobalKey<FormState>();

  String newPassword;

  EditMemberProfile(this.title);

  @override
  Widget build(BuildContext context) {
    if(title.contains("Phone")){
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
              child: TextFormField(
                controller: strController,
                decoration: InputDecoration(
                  labelText: title,
                ),
                validator: (value) {
                  if (value.isEmpty || value.length < 10 || value.length > 12) {
                    return "*Invalid " + title;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 70.0, bottom: 10),
            child: MaterialButton(
              minWidth: 120,
              elevation: 5.0,
              color: Colors.blue,
              child: Text("Confirm",style: TextStyle(color: Colors.white)),
              onPressed: (){
                if(_otpKey.currentState.validate()){
                  Navigator.pop(context);
                }
              },
            ),
          ),

        ],
      );
    }


    if(title.contains("Password")){
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
              key: _otpKey1,
              child: TextFormField(
                controller: strController,
                decoration: InputDecoration(
                  labelText: "Old Password",
                ),
                validator: (value) {
                  if (value.isEmpty || value.length < 6 ) {
                    return "*Invalid old password !";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Form(
              key: _otpKey2,
              child: TextFormField(
                controller: strController1,
                decoration: InputDecoration(
                  labelText: "New Password",
                ),
                validator: (value) {
                  if (value.isEmpty || value.length < 6 ) {
                    return "*Invalid " + title +" ! Must more than 6 characters !";
                  } else {
                    newPassword = value;
                    return null;
                  }
                },
              ),
            ),
            Form(
              key: _otpKey3,
              child: TextFormField(
                controller:strController2,
                decoration: InputDecoration(
                  labelText: "Confirm New Password",
                ),
                validator: (value) {
                  if (value.isEmpty || value != newPassword ) {
                    return "*Invalid " + title;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 70.0, bottom: 10),
            child: MaterialButton(
              minWidth: 120,
              elevation: 5.0,
              color: Colors.blue,
              child: Text("Confirm",style: TextStyle(color: Colors.white)),
              onPressed: (){
                if(_otpKey1.currentState.validate() &&_otpKey2.currentState.validate()&&_otpKey3.currentState.validate()){
                  Navigator.pop(context);
                }
              },
            ),
          ),

        ],
      );
    }

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

