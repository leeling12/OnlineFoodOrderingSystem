import 'package:flutter/material.dart';
import 'login.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'login_member.dart';

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterForm createState() => _RegisterForm();
}

class _RegisterForm extends State<RegisterForm> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneNum = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<ListItem> _dropdownItems = [
    ListItem(1, "None"),
    ListItem(2, "Female"),
    ListItem(3, "Male"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;


  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
  @override
  void initState(){
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

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
              title: Text('Member Register'),
              centerTitle: true,
            ),

            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
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
                              child: Image.asset(
                                'lib/assets/images/register_pic.jpg',
                                //width: 100,
                                height: 140,
                              ),
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Join us to get more promotion!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 22,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4,),
                                Text(
                                  'Please fill up the form below',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                     // controller: hPController,
                                      validator: validatename,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      labelText: 'Name',
                                      hintText: "eg. Lee Yin")
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    // controller: hPController,
                                     validator: validateMobile,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          alignLabelWithHint: true,
                                          labelText: 'IC Number',
                                          hintText: "eg. 000131140548")
                                  ),
                                  SizedBox(height: 15),
                                  _gender(),
                                  SizedBox(height: 10),

                                  //birthday
                                  BasicDateField(),

                                  SizedBox(height: 10),
                                  TextFormField(
                                    // controller: hPController,
                                     validator: validateMobile,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          alignLabelWithHint: true,
                                          labelText: 'Phone Number',
                                          hintText: "Insert your phone number")
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    // controller: hPController,
                                     validator: validateEmail,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                          alignLabelWithHint: true,
                                          labelText: 'Email',
                                          hintText: "Insert your email")
                                  )

                                ],
                              ),
                            ),

                            SizedBox(
                              height: 15,
                            ),

                            RawMaterialButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(30.0)),
                                fillColor: Colors.deepOrange[400],
                                splashColor: Colors.red[800],
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                      "Submit",
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.white)
                                  ),
                                ),
                                onPressed: () {
                                  if(_formKey.currentState.validate() && _selectedItem!=_dropdownMenuItems[0].value){
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                                    _ackAlert(this.context);

                                  }
                                }),
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
      ),
    );
  }
  Widget _gender(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Gender: "),
        SizedBox(width: 10,),
        DropdownButton<ListItem>(
            value: _selectedItem,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            }),
      ],
    );
  }

}

Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Register Successfully!'),
        //content: const Text('You can login now'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MemberLogin()));
            },
          ),
        ],
      );
    },
  );
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      //Text('Birthday'),
      DateTimeField(
        format: format,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: 'Birthday',
            hintText: "Select your birthday"),
        onShowPicker: (context, currentValue) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
        },
      ),
    ]);
  }
}



String validatename(String value) {

  if (value.length == 0)
    return "Name is Required";
  else
    return null;
}

String validateIC(String value) {

  if (value.length == 0)
    return "IC Number is Required";
  else if(value.length != 12)
    return "IC Number must 12 digits";
  else
    return null;
}

String validateMobile(String value) {
  if (value.length == 0) {
    return "Mobile is Required";
  } else if ((value.length != 11 && value.length != 12) ||
      (value.contains('-') == false)) {
    return "Mobile number must be 11 digits or 12 digits with dash '-'";
  } else
    return null;
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty)
    return "Email is Required";
  else if (value.compareTo('-') == 0)
    return null;
  else if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
