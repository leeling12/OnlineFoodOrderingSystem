
import 'package:flutter/material.dart';

import 'cart.dart';
import 'counterPayment.dart';
import 'cardPayment.dart';

//bool isMember = true; //false;//true;

String tax = "RM    2.61";
String totalPayment = "RM  46.10";

List<String> _forDineIn = ["Dine In", "Take Away"];
List<String> _paymentMethod = ["Debit Card", "Credit Card", "TNG e-wallet", "Pay with Cash"];
List<String> _listofMonth = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
List<String> _listofYear = ["2020", "2021", "2022", "2023", "2024", "2025", "2026", "2027", "2028", "2029", "2030",
  "2031", "2032", "2033", "2034", "2035", "2036", "2037", "2038", "2039", "2040"];
String _valForDineIn = _forDineIn[0];
String _valPaymentMethod = _paymentMethod[0];
String _valMonth = _listofMonth[8];
String _valYear = _listofYear[0];

String paymentMethodStr;
TextEditingController tableNumController;
TextEditingController carNumController, holderNameController;
bool tableNumExist = false, cardNumExist = false, cardHolderNameExist = false;
final _formKey = GlobalKey<FormState>(), _formKey1 = GlobalKey<FormState>();
final _formKey2 = GlobalKey<FormState>(), _formKey3 = GlobalKey<FormState>();

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Payment();
}



class Payment extends State<PaymentPage> {
  String pageTitle = "PAYMENT";

  @override
  void initState() {
    tableNumController = TextEditingController(text: "");
    carNumController = TextEditingController(text: "");
    holderNameController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(

            title: new Center(child:
              new Text(pageTitle,
                style: TextStyle(fontSize: 20, color: Colors.white),),
              ),
              backgroundColor: Colors
                  .cyan[800], // Color.fromRGBO(146, 170, 170, 100),
          ),
          body: ListView(
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      for(int i = 0; i < order.length; i++)
                        displayOrderDetails(i),
                      seperateLine(),

                      pricingDetails(),
                      SizedBox(height: 20),
                      seperateLine(),

                      DropDownPaymentMethod(),

                    ],
                  ),
                ),

              ]),
        )
    );
  }


  Widget displayOrderDetails(int i) {
    return Container(
        constraints: BoxConstraints(minWidth: 300, maxWidth: 500),
        //padding: EdgeInsets.all(6.0),
        margin: EdgeInsets.fromLTRB(20, 5, 10, 5),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Row(
                      children: <Widget>[
                        // Food's Name
                        Text(
                            order[i].qty.toString() + "   " + order[i].foodName,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        // Stall's Name
                        Text(" ( " + order[i].stallName + " ) ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ]),

                ),
                Expanded(
                  flex: 2,
                  child:
                  Text(order[i].price,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87),
                  ),
                ),
              ],
            ),
            if(isMember && i == 1)
              SizedBox(height: 8),

            if(isMember && i == 1)
              Row(
                // Stall's Name
                  children: <Widget>[
                    Text("       Promotion : - RM 2.00",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey),
                    ),
                  ]
              ),
            SizedBox(height: 15),
            //seperateLine(),

          ],
        )
    );
  }

  Widget pricingDetails() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 5, 10, 5),
      child:
      Column(
        children: [
          if(isMember)
            SizedBox(height: 10),
          // Total Discount
          if(isMember)
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text("   Discount ",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(":",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),

                Expanded(
                  flex: 6,
                  child: Text("RM    2.00  ",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),

              ],
            ),

          SizedBox(height: 15),
          // Subtotal
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("   Subtotal ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 2,
                child: Text(":",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),

              Expanded(
                flex: 6,
                child: Text(subTotal+"  ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),

            ],
          ),
          SizedBox(height: 15),
          // Total Tax
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("   Tax ( 6% )",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 2,
                child: Text(":",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),

              Expanded(
                flex: 6,
                child: Text(tax+"  ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),

            ],
          ),

          SizedBox(height: 15),
          // Total Payment
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("   Total",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Expanded(
                flex: 2,
                child: Text(":",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),

              Expanded(
                flex: 6,
                child: Text(totalPayment+"  ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),

            ],
          ),

        ],
      ),
    );
  }

}

// ----- Drop Down List for Dine In or Take Away
class DropDown extends StatefulWidget{
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State{

  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(
      value: _valForDineIn,
      items: _forDineIn.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _valForDineIn = value;
        });
      },
    );

  }
}

// --- Drop Down List for Payment Method
class DropDownPaymentMethod extends StatefulWidget{
  @override
  DropDownWidget1 createState() => DropDownWidget1();
}

class DropDownWidget1 extends State {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.0),
      margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Text("Pls fill up information below. ",
                style: TextStyle(fontSize: 17),),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text("Dine in / Take Away "),
              ),
              Expanded(
                flex: 2,
                child: Text(":"),
              ),
              Expanded(
                flex: 6,
                child: DropDown(), //dropDownList1(),
              ),
            ],
          ),

          SizedBox(height: 20),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("Payment Method "),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(":"),
                  ),
                  Expanded(
                    flex: 6,
                    child:
                    DropdownButton<String>(
                      value: _valPaymentMethod,
                      items: _paymentMethod.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _valPaymentMethod = value;
                        });
                      },

                    ),
                  ),

                ],
              ),
              if(_valPaymentMethod.contains('Card'))
                Container(
                  child: Column(
                      children: [
                        //Card Number
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("Card Number", style: TextStyle(
                                  fontSize: 13)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":"),
                            ),
                            Expanded(
                              flex: 5,
                              child: setCardNum(), //Text(""),
                            ),
                          ],
                        ),

                        //Card Holder Name
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("Card Holder Name", style: TextStyle(
                                  fontSize: 13)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":"),
                            ),
                            Expanded(
                              flex: 5,
                              child: setCardHolderName(),
                            ),
                          ],
                        ),

                        //Expired Date
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("Expired Date", style: TextStyle(
                                  fontSize: 13)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":"),
                            ),
                            Expanded(
                              flex: 5,
                              child: DropDownDateList(),
                            ),
                          ],
                        ),

                        //CVV
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(""),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text("CVV", style: TextStyle(
                                  fontSize: 13)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(":"),
                            ),
                            Expanded(
                              flex: 5,
                              child: setCardCVV(),
                            ),
                          ],
                        ),
                      ]),

                ),

            ],
          ),

          SizedBox(height: 20),
          // Prompt Table Number
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Text("Table No "),
              ),
              Expanded(
                flex: 2,
                child: Text(":"),
              ),
              Expanded(
                flex: 6,
                child: setTableNum(),
              ),
            ],
          ),

          SizedBox(height: 30),
          proceedBtn(),
        ],

      ),
    );
  }

  Widget setTableNum() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
              controller: tableNumController,
              validator: (value) {
                if (value.isEmpty) {
                  tableNumExist = false;
                  return "*Table Number is Required";
                } else {
                  tableNumExist = true;
                  return null;
                }
              },
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: "eg ： A01")),
        ],
      ),
    );
  }

  Widget setCardNum() {
    return Form(
      key: _formKey1,
      child: Column(
        children: <Widget>[
          TextFormField(
              style: TextStyle(fontSize: 13),
              controller: carNumController,
              validator: (value) {
                if (value.isEmpty) {
                  cardNumExist = false;
                  return "*Card Number is Required";
                } else if (value.length != 12) {
                  cardNumExist = false;
                  return "Card number must be 12 digits !";
                } else {
                  cardNumExist = true;
                  return null;
                }
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: "eg ： 605234873924",
              )),
        ],
      ),
    );
  }

  Widget setCardHolderName() {
    return Form(
      key: _formKey2,
      child: Column(
        children: <Widget>[
          TextFormField(
              style: TextStyle(fontSize: 13),
              controller: holderNameController,
              validator: (value) {
                if (value.isEmpty) {
                  cardHolderNameExist = false;
                  return "*Card Holder Name is Required";
                } else {
                  cardHolderNameExist = true;
                  return null;
                }
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: "eg ： Tan Bee Guat",
              )),
        ],
      ),
    );
  }

  Widget setCardCVV() {
    return Form(
      key: _formKey3,
      child: Column(
        children: <Widget>[
          TextFormField(
              obscureText: true,
              style: TextStyle(fontSize: 13),
              //controller: holderNameController,
              validator: (value) {
                if (value.isEmpty) {
                  cardHolderNameExist = false;
                  return "*Card CVV Number is Required";
                } else if (value.length != 3) {
                  cardHolderNameExist = false;
                  return "*Invalid CVV Number !";
                } else {
                  cardHolderNameExist = true;
                  return null;
                }
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: "eg ： 122",

              )),
        ],
      ),
    );
  }

  Widget proceedBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MaterialButton(
          onPressed: () {
              if(_valPaymentMethod.toLowerCase().contains("cash") || _valPaymentMethod.toLowerCase().contains("wallet") ){
                if( _formKey.currentState.validate()){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => new CounterPayment(isMember),
                  );
                }

               }else {
                if (_formKey1.currentState.validate() &&  _formKey2.currentState.validate()
                    && _formKey3.currentState.validate() &&  _formKey.currentState.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => new CardPayment(),
                    );
                }
              }

            //Payment
          },
          color: Colors.deepOrange,
          child: Text(" Proceed ", style: TextStyle(color: Colors.white),),
        ),

      ],
    );
  }

}

//---- drop down list for Month and Year
class DropDownDateList extends StatefulWidget{
  @override
  DropDownDates createState() => DropDownDates();
}

class DropDownDates extends State{

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
      DropdownButton<String>(
        value: _valMonth,
        items: _listofMonth.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _valMonth = value;
          });
        },
      ),
      SizedBox(width: 10),
      DropdownButton<String>(
        value: _valYear,
        items: _listofYear.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
        }).toList(),
          onChanged: (value) {
          setState(() {
            _valYear = value;
        });
        },
      ),
      ],
    );



  }
}

