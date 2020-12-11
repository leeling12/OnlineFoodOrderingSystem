import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'edit_member_profile.dart';

class MemberProfile extends StatefulWidget {
  @override
  MemberProfiles createState() => MemberProfiles();
}

class MemberProfiles extends State<MemberProfile> {

  @override
  Widget build(BuildContext context) {
    var height = double.infinity;
    var width = double.infinity;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: SafeArea(
        child: Container(
          width: width,
          height: height,
          //background
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/login_pic8.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,

            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.fromLTRB(30, 25, 30, 30),
                    padding: EdgeInsets.only(top: 1, bottom: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.white, // set border color
                            width: 3.0), // set border width
                        borderRadius: BorderRadius.all(
                            Radius.circular(10.0)),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black,
                              offset: Offset(1, 3))
                        ] // make rounded corner of border
                    ),
                    child:
                    Column(
                        children: [
                          // personal image
                          Stack(
                            children: <Widget>[
                              Container(
                                width: 110.0,
                                height: 110.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white70),
                                ),
                                margin: const EdgeInsets.only(top: 10.0),
                                padding: const EdgeInsets.all(3.0),
                                child: ClipOval(
                                    child: Image.asset("lib/assets/images/profile.png", fit: BoxFit.cover,)
                                ),
                              ),

                              //------ Upload Pic Icon ------//
                              Container(
                                width: 45,
                                margin: const EdgeInsets.only(
                                    top: 75.0, left: 75.0),
                                child: MaterialButton(
                                  onPressed: () {
                                  },
                                  color: Color.fromRGBO(22, 160, 133, 1),
                                  textColor: Colors.white,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 24,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  shape: CircleBorder(),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 20),

                          Text("Michelle ", style: TextStyle(fontSize: 20),),

                          SizedBox(height: 10),
                          Text("UserName : M001", style: TextStyle(fontSize: 13,
                              color: Colors.black54),),
                          SizedBox(height: 8),
                          Text("Edit" , style: TextStyle(fontSize: 12, color: Colors.blueGrey,decoration: TextDecoration.underline,)),

                          SizedBox(height: 20),
                          displayPersonalDetails("Password", "****"),
                          SizedBox(height: 15),
                          displayPersonalDetails("Phone No.", "0149123567"),
                          SizedBox(height: 15),
                          displayPersonalDetails("Birthday", "01/01/1990"),
                          SizedBox(height: 15),
                          displayPersonalDetails("IC No.", "900101140124"),
                          SizedBox(height: 15),
                          displayPersonalDetails("Gender", "Female"),
                          SizedBox(height: 15),
                          displayPersonalDetails(
                              "Email", "michelle1190@gmail.com"),
                          SizedBox(height: 15),
                          displayPersonalDetails("Join Date", "20/03/2019"),

                          SizedBox(height: 40),

                        ]),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget displayPersonalDetails(String title, String text) {
    return Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0)),

        ),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child:
                Row(
                  children: [
                    Text(title, style: TextStyle(fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text(" :   ", style: TextStyle(fontSize: 15,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold)),
                  ],
                )

            ),
            Expanded(
              flex: 6,
              child:
              Text(text, style: TextStyle(fontSize: 15),),
            ),
            Expanded(
              flex: 2,
              child:
              IconButton(
                alignment: Alignment.centerRight,
                color: Colors.blueGrey,
                iconSize: 20,
                icon: Icon(Icons.edit),
                onPressed: () {
                  if(title.contains("Phone") || title.contains("Password")){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => new EditMemberProfile(title),
                    );
                  }

                },
              ),
            ),
          ],

        )

    );
  }
}


