import 'package:bentayan/stall_owner/promotion_edit.dart';
import 'package:bentayan/stall_owner/stall_owner_layout.dart';
import 'package:flutter/material.dart';

import '../module_class/order_promotion_module.dart';
import 'package:dotted_border/dotted_border.dart';
import 'manage_edit.dart';

List<Promote> promoteItem = [
  Promote(
    stallName: 'Stall 1',foodName: 'Fish Chop',originalPrice: ' RM 14.50',
    promotePrice: 'RM 12.50',imgURL: 'lib/assets/images/stall1_pic3.jpg',
  ),
  Promote(
    stallName: 'Stall 1',foodName: 'Sphegatti',originalPrice: ' RM 13.00',
    promotePrice: 'RM 10.50',imgURL: 'lib/assets/images/stall1_pic4.jpg',
  ),
];

class ManagePromotion extends StatefulWidget {
  @override
  _ManagePromotion createState() => _ManagePromotion();
}

class _ManagePromotion extends State<ManagePromotion> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _add(),
            for(int i = 0; i < promoteItem.length; i++)
              _foodPromotionCard(i),
          ],
        )
    );
  }

  Widget _header(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Image.asset("lib/assets/images/icon1.png",height: 55,),
          SizedBox(width: 15,),
          Text(
            "Manage Promotion",
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
            height: 50,
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
                  "New Promotion",
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

Widget _foodPromotionCard(int i){
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
                      width: 90,
                      height: 90,
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.fromLTRB(25,25,25,10),
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new ExactAssetImage(promoteItem[i].imgURL),
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
                          promoteItem[i].foodName,
                          style: TextStyle(color: Colors.teal, fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          "Promotion Price: "+promoteItem[i].promotePrice,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15, fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Original Price: "+promoteItem[i].originalPrice,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // softWrap: false,
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
              _editDialog(context, i);
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

_editDialog(BuildContext context, int i) {
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
                child: PromotionEditForm(promoteItem[i],2),
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
        title: Text("ADD NEW PROMOTION"),
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
                child: PromotionEditForm.type(1),
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => StallOwnerLayout(3)));
            },
          ),
        ],
      )
  );
}
