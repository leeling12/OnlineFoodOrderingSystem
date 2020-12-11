import 'package:flutter/material.dart';
import 'category_list.dart';
import 'item_list.dart';
import 'package:bentayan/module_class/stall_module.dart';


class Menu extends StatefulWidget {
  final StallModule stall;
  const Menu(
      this.stall
      );

  @override
  _Menu createState() => _Menu();
}

class _Menu extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.stall.stallName),
          backgroundColor: Colors.cyan[800],
          elevation: 10.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          brightness: Brightness.light,

        ),
        body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            stallDescription(),
            popularHeader(),

            ItemList(widget.stall.menu),
            CategoryList(),
            FoodList(widget.stall.menu),

           // DiscountCard(),
          ],
        ),
      ),
    );
  }

  Widget popularHeader(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                  "Popular",
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: 3,
                width: 65,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  _showReportDialog(context);
                },
                child: Text(
                  "Change language",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 11
                  ),
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  _showReportDialog(context);
                },
                child: Image.asset(
                  "lib/assets/images/language_icon.png",
                  width: 30,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  //stall header
  Widget stallDescription(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /*Text(
            "Offers & Discounts",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),*/
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            height: 166,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.stall.img),
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black.withOpacity(0.3),
               /* gradient: LinearGradient(
                  colors: [
                    //Color(0xFFFF961F).withOpacity(0.7),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                  ],
                ),*/
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                   // Expanded(
                  //    child: Image.asset("lib/assets/images/stall1_pic1.jpg"),
                   // ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: widget.stall.description + "\n",
                              //text: "Steak and Grills, Western \n",
                              style: TextStyle(fontSize: 16),
                            ),
                            TextSpan(
                              text: widget.stall.stallName + "\n",
                              style: TextStyle(
                                fontSize: 43,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  widget.stall.operatingHrs + "\n",
                                  //"Operating Hours: Mon - Sun: 7:30 - 2:30 ",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> languageList = [
  "English",
  "Mandarin",
  "Malay",
];

_showReportDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        //Here we will build the content of the dialog
        return AlertDialog(
          title: Text("Choose a language"),
          content: MultiSelectChip(languageList),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  MultiSelectChip(this.reportList);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";
  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(
          Container(
            padding: const EdgeInsets.all(2.0),
            child: ChoiceChip(
              label: Text(item),
              selected: selectedChoice == item,
              onSelected: (selected) {
                setState(() {
                  selectedChoice = item;
                });
              },
            ),
          ));
    });
    return choices;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        children: _buildChoiceList(),
      ),
    );
  }
}






