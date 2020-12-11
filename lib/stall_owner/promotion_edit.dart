import 'package:bentayan/customer/guest/customer_homepage.dart';
import 'package:bentayan/module_class/order_promotion_module.dart';
import 'package:flutter/material.dart';
import 'stall_owner_layout.dart';


class PromotionEditForm extends StatefulWidget {
  Promote promoteItem;
  final int type;

  PromotionEditForm(this.promoteItem, this.type);
  PromotionEditForm.type(this.type);

  @override
  _PromotionEditForm createState() {
    return _PromotionEditForm();
  }
}

class _PromotionEditForm extends State<PromotionEditForm> {

  final _formKey = GlobalKey<FormState>();
  String formattedDate;

  //----------- variable ------------//
  TextEditingController foodNameController;
  TextEditingController oriPriceController;
  TextEditingController promotePriceController;
  TextEditingController statusController;


  @override
  void initState() {

    if(widget.type == 2){
      foodNameController = TextEditingController(text: widget.promoteItem.foodName);
      oriPriceController = TextEditingController(text: widget.promoteItem.originalPrice);
      promotePriceController = TextEditingController(text: widget.promoteItem.promotePrice);
    }

    super.initState();
  }

  @override
  void dispose() {
    foodNameController.dispose();
    oriPriceController.dispose();
    promotePriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: <Widget>[
            //------ Upload pic -------//
            Stack(
              children: <Widget>[
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70),
                  ),
                  margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.all(3.0),
                  child: ClipOval(
                      child: widget.type == 2
                          ? Image.asset(widget.promoteItem.imgURL, fit: BoxFit.cover,)
                          : Image.asset("lib/assets/images/icon4.png", fit: BoxFit.cover,)
                  ),
                ),

                //------ Upload Pic Icon ------//
                Container(
                  width: 45,
                  margin: const EdgeInsets.only(
                      top: 75.0, left: 75.0),
                  child: MaterialButton(
                    onPressed: () {
                      //_getImage();
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
            InkWell(
              child: Text(
                'Change Pic',
                style: TextStyle(
                    fontSize: 13, color: Colors.blueGrey),
              ),
              onTap: () {
                //_getImage();
              },
            ),

            //---- details -----//
            _changeName(),
            SizedBox(height: 10,),
            _changeOriPrice(),
            SizedBox(height: 10,),
            _changePromotePrice(),
            SizedBox(height: 50,),

            //----- SAVE button ----//
            Padding(
              // padding: const EdgeInsets.symmetric(vertical: 20.0),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: RaisedButton(
                color: Colors.green,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    if(widget.type == 2) {
                      widget.promoteItem.foodName = foodNameController.text;
                      widget.promoteItem.originalPrice = oriPriceController.text;
                      widget.promoteItem.promotePrice = promotePriceController.text;
                    }

                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:  widget.type == 2
                              ?Text("Edit Successfully!")
                              : Text("Add Successfully!"),
                          actions: <Widget>[
                            FlatButton(
                              child: new Text('OK'),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(3)));
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _changeName() {
      return TextFormField(
          controller: foodNameController,
          validator: validateName,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Food Name',
              hintText: "eg. Chicken Rice"));
  }

  String validateName(String value) {
    bool exist = false;

    for(int i = 0; i < foodList.length; i++){
      if(foodList[i].name.contains(value)&&!foodList[i].name.contains(widget.promoteItem.foodName)){
        exist = true;
        break;
      }
    }

    if (value.length == 0)
      return "Food Name is Required";
    else if(exist)
      return "Food Name already exist! Please change another name";
    else
      return null;
  }

  Widget _changeOriPrice() {
      return TextFormField(
          controller: oriPriceController,
          validator: validateOriPrice,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Original Price',
              hintText: "eg. RM 12.00"));
  }

  String validateOriPrice(String value) {
    if (value.length == 0)
      return "Original Price is Required";
    else
      return null;
  }

  Widget _changePromotePrice() {
      return TextFormField(
          controller: promotePriceController,
          validator: validatePrommotePrice,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Promote Price',
              hintText: "eg. RM 15.00"));

  }

  String validatePrommotePrice(String value) {
    if (value.length == 0)
      return "Promote Price is Required";
    else
      return null;
  }


}