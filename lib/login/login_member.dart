import 'package:bentayan/customer/member/member_layout.dart';
import 'package:flutter/material.dart';
import 'package:bentayan/module_class/member_module.dart';
import 'forgot_password.dart';
import 'register.dart';

MemberModule member1 = new MemberModule("M001", "0000", "Lee", "Female", "6012-9654118", "lee@gmail.com", "29-09-2000", "04-08-2020");

class MemberLogin extends StatefulWidget {
  @override
  _MemberLogin createState() => _MemberLogin();
}

class _MemberLogin extends State<MemberLogin> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  TextEditingController myUsername = TextEditingController();
  TextEditingController myPassword = TextEditingController();
  bool _checkboxValue = false;

  @override
  void dispose() {
    myUsername.dispose();
    myPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // SystemChrome.setPreferredOrientations([
   //   DeviceOrientation.portraitUp,
   //   DeviceOrientation.portraitDown,
  //  ]);
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
            key: _scaffoldKey,
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.transparent,

            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.cyan[800],
              title: Text('Sign In As Member'),
              centerTitle: true,
            ),

            body: Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 0, left: 30, right: 30),
                  //alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 1, bottom: 1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Colors.white, // set border color
                          width: 3.0), // set border width
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)), // set rounded corner radius
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black,
                            offset: Offset(1, 3))
                      ] // make rounded corner of border
                  ),
                  child: Form(
                    key: _formKey,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Image.asset(
                                  'lib/assets/images/login_pic1.jpg',
                                  //width: 100,
                                  height: 110,
                                ),
                              ],
                            ),
                          ),

                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: myUsername,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    prefixStyle: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Enter your member ID',
                                  ),
                                ),
                                SizedBox(height: 10),
                                TextFormField(
                                  controller: myPassword,
                                  validator: validatePassword,
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    hintText: "Enter your password",
                                    prefixStyle: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                  value: _checkboxValue,
                                  onChanged: (value) {
                                    setState(() {
                                      _checkboxValue = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Remember Me",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            //width: width,
                            //height: height,
                            //padding: EdgeInsets.only(left: 90),
                            child: Column(
                              children: <Widget>[
                                RawMaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(30.0)),
                                    fillColor: Colors.deepOrange[400],
                                    splashColor: Colors.red[800],
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const <Widget>[
                                          Icon(
                                            Icons.face,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "Log In",
                                            maxLines: 1,
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      // ignore: unrelated_type_equality_checks
                                      if (_formKey.currentState.validate()) {
                                        if(myUsername.toString().contains(member1.memberID)  && myPassword.toString().contains(member1.password)){
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MemberLayout(0),
                                              ), (route) {
                                            return route == null;
                                          });
                                        }else{
                                          _displaySnackBar(context);
                                        }
                                      }

                                    })
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 180),
                            child: new GestureDetector(
                                child: Text(
                                    "Forget Password",
                                    style: TextStyle(
                                        fontSize: 13,
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue)),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                                }),
                          ),

                          SizedBox(height: 20,),

                          Container(
                           padding: EdgeInsets.only(right: 10, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Not a member yet? "),
                                new GestureDetector(
                                    child: Text(
                                        "Register here",
                                        style: TextStyle(
                                            fontSize: 14,
                                            decoration: TextDecoration.underline,
                                            color: Colors.blue)),
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterForm()));
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displaySnackBar(BuildContext context) {
    final snackBar = SnackBar(content: errorMessage());
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

class LoginAcc {
  String username;
  String password;

  LoginAcc(this.username, this.password);
}

Widget errorMessage() {
  return Text(
    "Invalid Member ID or Password",
    style: TextStyle(color: Colors.red),
  );
}

String validateName(String value) {

  if (value.length == 0)
    return "Member ID is Required";
  else
    return null;
}

String validatePassword(String value) {

  if (value.length == 0)
    return "Password is Required";
  else
    return null;
}