import 'package:bentayan/customer/guest/guest_layout.dart';
import 'package:flutter/material.dart';
import 'login_member.dart';
import 'login_stall_owner.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("lib/assets/images/login_pic8.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome to Bentayan Food Court",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //guest
                  new MaterialButton(
                    height: 45.0,
                    minWidth: 250.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    color: Colors.cyan[800],
                    textColor: Colors.white,
                    child: new Text("Visit as a guest"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GuestLayout(0)));
                    },
                    splashColor: Colors.teal,
                  ),

                  SizedBox(height: 15),

                  //member
                  new MaterialButton(
                    height: 45.0,
                    minWidth: 250.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    color: Colors.cyan[800],
                    textColor: Colors.white,
                    child: new Text("Sign in as a member"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MemberLogin()));
                    },
                    splashColor: Colors.teal,
                  ),

                  SizedBox(height: 15),

                  //stall owner
                  new MaterialButton(
                    height: 45.0,
                    minWidth: 250.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)
                    ),
                    color: Colors.cyan[800],
                    textColor: Colors.white,
                    child: new Text("Sign in as a stall owner"),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLogin()));
                    },
                    splashColor: Colors.teal,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
