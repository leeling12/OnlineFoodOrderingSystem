
import 'package:bentayan/module_class/order_promotion_module.dart';
import 'package:flutter/material.dart';

List<Promote> promoteItem = [
  Promote(
      stallName: 'Stall 1',foodName: 'Fish Chop',originalPrice: ' RM 14.50',
      promotePrice: 'RM 12.50',imgURL: 'lib/assets/images/stall1_pic3.jpg',
    ),
  Promote(
    stallName: 'Stall 3',foodName: 'Fish Porrige',originalPrice: ' RM 9.00',
    promotePrice: 'RM 7.50',imgURL: 'lib/assets/images/stall3.jpg',
  ),
  Promote(
    stallName: 'Stall 1',foodName: 'Sphegatti',originalPrice: ' RM 13.00',
    promotePrice: 'RM 10.50',imgURL: 'lib/assets/images/stall1_pic4.jpg',
  ),
  Promote(
    stallName: 'Stall 5',foodName: 'Dumplings',originalPrice: ' RM 7.00',
    promotePrice: 'RM 5.00',imgURL: 'lib/assets/images/dumpling.jpg',
  ),
];

List<Color> iconColor = new List<Color>();

class Promotion extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Promotions();
}

class Promotions extends State<Promotion> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    for(int i = 0; i < promoteItem.length; i++){
      iconColor.add(Colors.black);
    }

    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,

          body: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),

                    for(int i = 0; i < promoteItem.length; i++)
                      Container(
                          height: 200,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(promoteItem[i].imgURL),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                      Colors.black.withOpacity(.8),
                                      Colors.black.withOpacity(.1),
                                    ]
                                )
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(promoteItem[i].foodName + " - "+promoteItem[i].stallName, style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'RobotoMono')),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text(promoteItem[i].promotePrice, style: TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Roboto'),),

                                      Text(" ( Normal Price : "+promoteItem[i].originalPrice+" )", style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'Roboto'),),

                                      Spacer(),
                                      //add to cart icon
                                      Container(
                                        width: 35,
                                        height: 35,
                                        margin: EdgeInsets.only(bottom: 10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: IconButton(
                                          color: iconColor[i],
                                          iconSize: 23,
                                          icon: Icon(Icons.add_shopping_cart),
                                          onPressed: (){
                                            setState(() {
                                              iconColor[i] = Colors.grey;
                                            });
                                            _displaySnackBar(context, i);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                        ]),
                      ),
                    ),

                  ],
                ),
              ]),


        )
    );
  }

  _displaySnackBar(BuildContext context, i) {
    final snackBar = SnackBar(content: Text(promoteItem[i].foodName + " is added to your cart ! "));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}

