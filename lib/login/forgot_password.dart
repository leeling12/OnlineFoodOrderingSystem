import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController otp_controller = TextEditingController();
  bool _valid = false;
  final int otp = 666666;

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
              title: Text('Forgot Password'),
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
                        //key: _formKey,
                        children: <Widget>[
                          Container(
                            child: Image.asset(
                                  'lib/assets/images/forgot_password.jpg',
                                  //width: 100,
                                  height: 160,
                                ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Forgot Your Password?',
                                style: TextStyle(fontSize: 22,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Enter your phone number to retrieve OTP to proceed reset password',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: phoneNum,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    prefixStyle: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.w600),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    hintText: 'Enter your phone number',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "Mobile is Required";
                                    } else if (!(value.length == 10 || value.length == 11) ||
                                        (value.contains('-') == true)) {
                                      return "Mobile number must be 10 digits or 11 digits without dash '-'";
                                    } else
                                      return null;
                                  }
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          _valid
                          ?SizedBox(height: 10)
                          :Container(
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
                                      child: Text(
                                          "Send OTP",
                                          maxLines: 1,
                                          style: TextStyle(color: Colors.white)
                                      ),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      if(_formKey.currentState.validate()){
                                         //Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                                        setState(() {
                                          _valid = true;
                                        });
                                      }
                                    })
                              ],
                            ),
                          ),

                          _valid
                          ? Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: TextFormField(
                                          controller: otp_controller,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            prefixStyle: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                            hintText: 'Enter OTP here',
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "OTP is Required";
                                            } else if ((value.length != 6)) {
                                              return "OTP mush have 6 digits";
                                            } else
                                              return null;
                                          },

                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      flex: 1,
                                      child: RawMaterialButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              new BorderRadius.circular(5.0)),
                                          fillColor: Colors.deepOrange[400],
                                          splashColor: Colors.red[800],
                                          child: Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                                "Resend",
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: Colors.white)
                                            ),
                                          ),
                                          onPressed: () {
                                            _resend(context);
                                          }),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15),
                                RawMaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        new BorderRadius.circular(30.0)),
                                    fillColor: Colors.teal[400],
                                    splashColor: Colors.blue,
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text(
                                          "Submit",
                                          maxLines: 1,
                                          style: TextStyle(color: Colors.white)
                                      ),
                                    ),
                                    onPressed: () {
                                      if(_formKey.currentState.validate()){
                                        _ackAlert(this.context);
                                        // ignore: unrelated_type_equality_checks
                                       // if(otp_controller.value == 666666){
                                       //   _ackAlert(this.context);
                                      //  }
                                      }
                                    })
                              ],
                            ),
                          )
                          : SizedBox(height: 5),

                          SizedBox(
                            height: 15,
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
}

Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Submit Successfully'),
        content: const Text('Your new password has successfully sent to your sms'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      );
    },
  );
}

Future<void> _resend(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Your OTP code has been sent to your phone'),
        content: const Text('Please enter your OTP and proceed'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
