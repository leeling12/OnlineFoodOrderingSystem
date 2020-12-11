import 'package:bentayan/customer/member/member_layout.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bentayan/customer/menu.dart';
import 'package:bentayan/module_class/stall_module.dart';
import 'package:bentayan/customer/item_list.dart';
import 'package:bentayan/customer/member/promotion.dart';
import 'package:bentayan/customer/guest/customer_homepage.dart';

class MemberHomePage extends StatefulWidget {

  @override
  _MemberHomePage createState() => _MemberHomePage();
}

class _MemberHomePage extends State<MemberHomePage> {
  int _current = 0;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Column(
                  children: [
                    CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((url) {
                        int index = imgList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Color.fromRGBO(0, 0, 0, 0.9)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ]
              ),

              //Promotion
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Promotion",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                    ),
                    promotionButton(),
                  ],
                ),
              ),

              PromotionList(),

              ////Stalls
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Stalls",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                    ),
                   /* Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),*/
                   SizedBox(height: 10,),

                    //display the stall card
                    for(int i = 0; i < stallList.length; i++) _stallCard(i),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promotionButton(){
    return Container(
      height: 35,
    //  width: 100,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MemberLayout(2)));
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "More promotion  >",
              style: TextStyle(
                color: Colors.white,
                //fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _stallCard(int i){
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 120,
          child: Card(
            elevation: 16,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(stallList[i])));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0)
                  ),
                  image: DecorationImage(
                    image: AssetImage(stallList[i].img),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stallList[i].stallName,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      stallList[i].description,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //button
              Expanded(
                flex: 1,
                child: MaterialButton(
                  height: 25.0,
                  //minWidth: 250.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                  ),
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: new Text("Go to stall"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(stallList[i])));
                  },
                  splashColor: Colors.teal,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}

final List<Widget> imageSliders = imgList.map((item) => Builder(
    builder:(BuildContext context){
      return Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Menu(slideList[imgList.indexOf(item)].stall)));
                    },
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(100, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    child: Text(
                      ' ${slideList[imgList.indexOf(item)].text}' ,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      //),
                    ),
                  ),
                )
              ],
            )
        ),
      );
    }
)).toList();






