import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:bentayan/module_class/stall_module.dart';

class FoodInfo extends StatefulWidget {
  final FoodModule food;
  const FoodInfo(
      this.food,
      );
  @override
  _FoodInfo createState() => _FoodInfo();
}

class _FoodInfo extends State<FoodInfo> {
  int _n = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(40),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //------title with rating bar------//
          header(),

          SizedBox(height: 30,),

          //description
          Text(
              widget.food.description
          ),

          SizedBox(height: 40,),

          //------quantity button------//
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 35,
                        child: FloatingActionButton(
                          heroTag: "btn1",
                          onPressed: add,
                          child: new Icon(Icons.add, color: Colors.black,),
                          backgroundColor: Colors.white,),
                      ),

                      //SizedBox(width: 30,),

                      Text('$_n',
                          style: new TextStyle(fontSize: 20.0)),

                      //SizedBox(width: 30,),

                      SizedBox(
                        width: 35,
                        child: FloatingActionButton(
                          heroTag: "btn2",
                          onPressed: minus,
                          child: new Icon(
                              const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                              color: Colors.black),
                          backgroundColor: Colors.white,),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                    child: orderButton()
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  void add() {
    setState(() {
      _n++;
    });
  }

  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }

  Widget header(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                widget.food.name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
            ),

            SizedBox(height: 10),
            Row(
              children: [
                SmoothStarRating(
                  onRated: (v) {
                  },
                  starCount: 5,
                  rating: widget.food.rating,
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
                SizedBox(width: 20),
                Text(
                    widget.food.reviews,
                    style: TextStyle(
                        //fontSize: 15,
                        color: Colors.black54
                    )
                ),
              ],
            ),
            SizedBox(height: 10,),

          ],
        ),

        //price
        priceTag(context, price: widget.food.price),
      ],
    );
  }
  Widget orderButton(){
    return Container(
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: InkWell(
          onTap: (){
            _successDialog(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

}

ClipPath priceTag(BuildContext context, {String price}) {
  return ClipPath(
    clipper: PricerCliper(),
    child: Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 15),
      height: 66,
      width: 70,
      color: Colors.orange,
      child: Text(
        "$price",
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          )
      ),
    ),
  );
}


class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

_successDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("Successfully Added!"),
        actions: <Widget>[
          FlatButton(
            child: new Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      )
  );
}