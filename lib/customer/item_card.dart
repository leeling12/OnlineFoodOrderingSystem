import 'package:flutter/material.dart';

//small card
class ItemCard extends StatelessWidget {
  final String title, shopName, img;
  final Function press;
  const ItemCard({
    Key key,
    this.title,
    this.shopName,
    this.img,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 2),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Container(
                    constraints: BoxConstraints(minWidth: 80, maxWidth: 105),
                  //width: size.width - 255,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(25),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new ExactAssetImage(img),
                )
            )
                ),
                Text(title),
                SizedBox(height: 10),
                Text(
                  shopName,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//small card
class PromotionCard extends StatelessWidget {
  final String foodName, stallName, img, originalPrice, promotePrice;
  final Function press;
  const PromotionCard({
    Key key,
    this.foodName,
    this.stallName,
    this.img,
    this.originalPrice,
    this.promotePrice,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 2),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  stallName,
                  textAlign: TextAlign.start,
                  style: TextStyle(color:Colors.black,fontSize: 17, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Container(
                        constraints: BoxConstraints(minWidth: 80, maxWidth: 105),
                        //width: size.width - 255,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 15),
                        padding: EdgeInsets.all(25),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: new ExactAssetImage(img),
                            )
                        )
                    ),
                    Text(
                      foodName,
                      style: TextStyle(color:Colors.black,fontSize: 15,),
                    ),

                    SizedBox(height: 10,),

                    Text(
                      "Now: "+promotePrice,
                      style: TextStyle(color:Colors.black,fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "original price:"+originalPrice,
                      style: TextStyle(color:Colors.black54,fontSize: 12),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

//food card
class FoodCard extends StatelessWidget {
  final String foodName, description, img, price;
  final Function press;
  const FoodCard({
    Key key,
    this.foodName,
    this.description,
    this.price,
    this.img,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.baseline,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    constraints: BoxConstraints(minWidth: 65, maxWidth: 130),
                    //width: size.width - 255,
                    height: 130,
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.all(25),
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: new ExactAssetImage(img),
                        )
                    )
                ),
                SizedBox(width: 20,),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          foodName,
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
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
    );
  }
}
