import 'package:bentayan/customer/member/member_layout.dart';
import 'package:bentayan/module_class/stall_module.dart';
import 'package:flutter/material.dart';
import 'item_card.dart';
import 'menu_details.dart';
import 'member/promotion.dart';


class ItemList extends StatelessWidget {
  final List<FoodModule> foodList;
  const ItemList(
      this.foodList
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            img: "lib/assets/images/stall1_pic1.jpg",
            title: "Chicken Chops",
            shopName: "RM 13.90",
            press: () {
              //MenuDetails
              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(foodList[0])));
            },
          ),
          ItemCard(
            img: "lib/assets/images/stall1_pic2.jpg",
            title: "Spaghetti Bolognese",
            shopName: "RM 15.90",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(foodList[2])));
            },
          ),
          ItemCard(
            img: "lib/assets/images/login_pic9.jpg",
            title: "Chinese & Rice",
            shopName: "RM 12.90",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(foodList[1])));
            },
          )
        ],
      ),
    );
  }
}

class FoodList extends StatelessWidget {
  final List<FoodModule> foodList;
  const FoodList(
      this.foodList
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: Column(
        children: <Widget>[
          for(int i = 0; i < foodList.length; i++)
          FoodCard(
            img: foodList[i].img,
            foodName: foodList[i].name,
            description: foodList[i].description,
            price: foodList[i].price,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDetails(foodList[i])));
            },
          ),
        ],
      ),
    );
  }
}

class PromotionList extends StatelessWidget {
  const PromotionList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for(int i = 0; i < promoteItem.length; i++)
            PromotionCard(
              img: promoteItem[i].imgURL,
              foodName: promoteItem[i].foodName,
              stallName: promoteItem[i].stallName,
              originalPrice: promoteItem[i].originalPrice,
              promotePrice: promoteItem[i].promotePrice,
              press: () {
                //MenuDetails
                Navigator.push(context, MaterialPageRoute(builder: (context) => MemberLayout(2)));
              },
          ),
        ],
      ),
    );
  }
}