import 'package:bentayan/module_class/stall_module.dart';
import 'package:bentayan/stall_owner/stall_owner_layout.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:bentayan/customer/guest/customer_homepage.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'manage_edit.dart';

class ManageMenu extends StatefulWidget {
  @override
  _ManageMenu createState() => _ManageMenu();
}

class _ManageMenu extends State<ManageMenu> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _header(),
          _add(),
          for(int i = 0; i < stallList[0].menu.length; i++)_foodCard(stallList[0].menu[i]),
        ],
      )
    );


  }

  Widget _header(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.end,
        //crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image.asset("lib/assets/images/icon4.png",height: 55,),
          SizedBox(width: 15,),
          Text(
            "Manage Menu",
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
            ),
          ),
        ],
      ),
    );
  }

  Widget _add(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: GestureDetector(
        onTap: (){
          _addDialog(context);
        },
        child: DottedBorder(
          dashPattern: [6, 3, 6, 3],
          borderType: BorderType.RRect,
          radius: Radius.circular(15),
          padding: EdgeInsets.all(6),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              height: 60,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.black54,
                    size: 40.0,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    "New Food",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  Widget _foodCard(FoodModule food){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.35),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        constraints: BoxConstraints(minWidth: 65, maxWidth: 130),
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(25),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new ExactAssetImage(food.img),
                            )
                        )
                    ),
                    SizedBox(width: 20,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            children: [
                              SmoothStarRating(
                                onRated: (v) {
                                },
                                starCount: 5,
                                rating: food.rating,
                                size: 20.0,
                                isReadOnly:true,
                                filledIconData: Icons.star,
                                halfFilledIconData: Icons.star_half,
                                defaultIconData: Icons.star_border,
                                allowHalfRating: true,
                                spacing: 2.0,
                                color: Colors.yellow,
                                borderColor: Colors.yellow,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "("+food.reviews+")",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),


                          SizedBox(height: 20),
                          Text(
                            "Description: "+food.description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                           // softWrap: false,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Price: "+food.price,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            food.status?"Status: Available":"Status: Not Available",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 25.0,
          right: 70.0,
          child: Container(
            width: 40,
            margin:
            const EdgeInsets.only(top: 0.0, left: 0),
            child: MaterialButton(
              onPressed: () {
                _editDialog(context, food);
              },
              elevation: 2,
              color: Colors.white,
              textColor: Colors.green,
              child: Icon(
                Icons.edit,
                size: 22,
              ),
              padding: EdgeInsets.all(10),
              shape: CircleBorder(),
            ),
          ),
        ),

        //----delete button----//
        Positioned(
          top: 25.0,
          right: 25.0,
          child: Container(
            width: 40,
            margin:
            const EdgeInsets.only(top: 0.0, left: 0),
            child: MaterialButton(
              onPressed: () {
                _deleteDialog(context);
              },
              elevation: 2,
              color: Colors.white,
              textColor: Colors.deepOrange[400],
              child: Icon(
                Icons.delete,
                size: 22,
              ),
              padding: EdgeInsets.all(10),
              shape: CircleBorder(),
            ),
          ),
        ),
      ],
    );
  }
}

_editDialog(BuildContext context, FoodModule food) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
          title: Text("EDIT"),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.25);
            var width = MediaQuery.of(context).size.width;

            return Container(
              height: height,
              width: width - 50,
              child: SingleChildScrollView(
                child: MenuEditForm(food, 2),
              ),
            );
          },
        ),
      )
  );
}

_addDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("ADD NEW FOOD"),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.25);
            var width = MediaQuery.of(context).size.width;

            return Container(
              height: height,
              width: width - 50,
              child: SingleChildScrollView(
                child: MenuEditForm.type(1),
              ),
            );
          },
        ),
      )
  );
}

_deleteDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("Confirm delete?"),
        actions: <Widget>[
          FlatButton(
            child: new Text('No'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: new Text('Yes', style: TextStyle(color: Colors.red),),
            onPressed: () {
              _successDialog(context);
            },
          ),
        ],
      )
  );
}

_successDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("Successfully Delete!"),
        actions: <Widget>[
          FlatButton(
            child: new Text('OK'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(2)));
            },
          ),
        ],
      )
  );
}