import 'package:flutter/material.dart';
import 'food_info.dart';
import 'package:bentayan/module_class/stall_module.dart';

class MenuDetails extends StatefulWidget {
  final FoodModule food;
  const MenuDetails(
      this.food,
      );

  @override
  _MenuDetails createState() => _MenuDetails();
}

class _MenuDetails extends State<MenuDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.name),
        backgroundColor: Colors.cyan[800],
        elevation: 10.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        brightness: Brightness.light,

      ),
      body: Stack(
        children: <Widget>[
            Image.asset(
              widget.food.img,
              //height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 255, 0, 0),
              child: FoodInfo(widget.food),
            ),
        ],
      )
    );
  }
}




