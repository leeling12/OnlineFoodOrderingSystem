import 'package:bentayan/customer/guest/customer_homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bentayan/module_class/stall_module.dart';
import 'dart:async';
import 'dart:io';
import 'stall_owner_layout.dart';

List<String> _status = ["Available", "Not Available"];
String _valStatus;

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

class MenuEditForm extends StatefulWidget {
  FoodModule food;
  final int type;
  //final File _imageUpload;
  //const MenuEditForm(this._imageUpload, this.food);
   MenuEditForm(this.food, this.type);
   MenuEditForm.type(this.type);

  @override
  _MenuEditForm createState() {
    return _MenuEditForm();
  }
}

class _MenuEditForm extends State<MenuEditForm> {
  final _formKey = GlobalKey<FormState>();
  String formattedDate;

  //----------- variable ------------//
  TextEditingController foodNameController;
  TextEditingController descriptionController;
  TextEditingController priceController;
  TextEditingController statusController;

  String _nameValua, _descriptionValue, _priceValue;

  List<ListItem> _dropdownItems = [
    ListItem(1, "Available"),
    ListItem(2, "Not Available"),
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
  void initState() {

    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);

    if(widget.type == 2){
      if(widget.food.status)
        _selectedItem = _dropdownMenuItems[0].value;
      else
        _selectedItem = _dropdownMenuItems[1].value;
      foodNameController = TextEditingController(text: widget.food.name);
      descriptionController = TextEditingController(text: widget.food.description);
      priceController = TextEditingController(text: widget.food.price);
      statusController = TextEditingController(text: "Available");
    }else{
      _selectedItem = _dropdownMenuItems[0].value;
    //  foodNameController = TextEditingController(text: null);
    //  descriptionController = TextEditingController(text: null);
    //  priceController = TextEditingController(text: null);
    //  statusController = TextEditingController(text: "Available");
    }

    super.initState();
  }

  @override
  void dispose() {
    foodNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    statusController.dispose();
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
                          ? Image.asset(widget.food.img, fit: BoxFit.cover,)
                          : Image.asset("lib/assets/images/icon5.png", fit: BoxFit.cover,)
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
              _changeDescription(),
              SizedBox(height: 10,),
              _changePrice(),
              SizedBox(height: 10,),
              _changeStatus(),
              SizedBox(height: 50,),

              //----- SAVE button ----//
              Padding(
                // padding: const EdgeInsets.symmetric(vertical: 20.0),
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if(widget.type == 2){
                        widget.food.name = foodNameController.text;
                        widget.food.description = descriptionController.text;
                        widget.food.price = priceController.text;
                        if(_selectedItem == _dropdownMenuItems[0].value)
                          widget.food.status = true;
                        else
                          widget.food.status = false;
                      }
                        return showDialog(
                          context: context,
                          //barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: widget.type == 2
                                ?Text("Edit Successfully!")
                              : Text("Add Successfully!"),
                              actions: <Widget>[
                                FlatButton(
                                  child: new Text('OK'),
                                  onPressed: (){
                                    //_navigateAndDisplaySelection(context);
                                    // Navigator.of(context).pop(true);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(2)));
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
    if(widget.type == 2){
      return TextFormField(
          controller: foodNameController,
          //onChanged: (text) => {},
          validator: validateName,
          //keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Food Name',
              hintText: "eg. Chicken Rice"));
    }else{
      return TextFormField(
          onChanged: (text) => {_nameValua = text},
          validator: validateName,
          //keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Food Name',
              hintText: "eg. Chicken Rice"));
    }
  }

  String validateName(String value) {
    bool exist = false;

    for(int i = 0; i < foodList.length; i++){
      if(foodList[i].name.contains(value)&&!foodList[i].name.contains(widget.food.name)){
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

  Widget _changeDescription() {
    if(widget.type == 2){
      return TextFormField(
          controller: descriptionController,
          //onChanged: (text) => {},
          validator: validateDescription,
          //keyboardType: TextInputType.phone,
          minLines: 2,
          maxLines: 4,
          decoration: InputDecoration(

              alignLabelWithHint: true,
              labelText: 'Description',
              hintText: "eg. serve with soup"));
    }else{
      return TextFormField(
          //controller: descriptionController,
          onChanged: (text) => {_descriptionValue = text},
          validator: validateDescription,
          //keyboardType: TextInputType.phone,
          minLines: 1,
          maxLines: 4,
          decoration: InputDecoration(

              alignLabelWithHint: true,
              labelText: 'Description',
              hintText: "eg. serve with soup"));
    }

  }

  String validateDescription(String value) {
    if (value.length == 0)
      return "Description is Required";
    else
      return null;
  }

  Widget _changePrice() {
    if(widget.type == 2){
      return TextFormField(
          controller: priceController,
          //onChanged: (text) => {},
          validator: validatePrice,
          //keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Price',
              hintText: "eg. RM 15.00"));
    }else{
      return TextFormField(
         // controller: priceController,
          onChanged: (text) => {_priceValue = text},
          validator: validatePrice,
          //keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelText: 'Price',
              hintText: "eg. RM 15.00"));
    }

  }

  String validatePrice(String value) {
    if (value.length == 0)
      return "Price is Required";
    else
      return null;
  }

  Widget _changeStatus(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Status: "),
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