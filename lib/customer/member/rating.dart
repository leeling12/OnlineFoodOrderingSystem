
import 'package:flutter/cupertino.dart';

import '../share_guest_member/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dotted_border/dotted_border.dart';

List<double> ratings = List<double>();

class Rating extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Ratings();
}

class Ratings extends State<Rating> {

  @override
  Widget build(BuildContext context) {


    for(int j = 0; j < order.length; j++)
       ratings.add(0.0);

    return SafeArea(
        child: Scaffold(

          body: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),

                    displayRatingBar(context),
                    SizedBox(height: 20),
                    displayAnotherRatingBar(context),
                    SizedBox(height: 20),

                  ],
                ),
              ]),

        )
    );

  }


Widget displayRatingBar(BuildContext context){
  return DottedBorder(
      dashPattern: [25, 3, 25, 3],
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      padding: EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Container(
         // margin: const EdgeInsets.only(left: 5.0, bottom: 5.0),
          padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
          decoration: BoxDecoration(
              color: Colors.white,

          ),

          child: Column(
            children: [
              Container(
                width: 250,
                alignment: Alignment.topRight,
                child:
                  Text("9/9/2020", style: TextStyle(fontSize: 12, color: Colors.grey,),textAlign: TextAlign.left)

              ),

              SizedBox(height: 20),

              for(int i = 0; i < order.length; i++)
                ratingBar(context, i),

              SizedBox(height: 20),

              SubmitBtn(),
            ],
          ),
        ),
      ),

  );
}




// icon that can close the pop out window
Widget ratingBar(BuildContext context, int i) {

  return Column(
      children: [
        Text(order[i].foodName + " ("+ order[i].stallName+") "),
        SizedBox(height: 10),

        FlutterRatingBar(
          initialRating: ratings[i],
          fillColor: Colors.amber,
          borderColor: Colors.amber.withAlpha(50),
          allowHalfRating: true,

          onRatingUpdate: (rating) {
            print(rating);
            ratings[i] = rating;
          },
        ),

        SizedBox(height: 20),

      ],
  );
}

//----------- another rating (submitted)------//
  Widget displayAnotherRatingBar(BuildContext context){

    return DottedBorder(
      dashPattern: [25, 3, 25, 3],
      borderType: BorderType.RRect,
      radius: Radius.circular(15),
      padding: EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
            decoration: BoxDecoration(
            color: Colors.white,

            ),
            child: Column(
              children: [
                Container(
                  width: 250,
                  alignment: Alignment.topRight,
                  child:
                    Text("15/8/2020", style: TextStyle(fontSize: 12, color: Colors.grey,),textAlign: TextAlign.left)
                  ),

                  SizedBox(height: 20),

                  Column(
                    children: [
                      Text(order[0].foodName+ " ("+ order[0].stallName+") "),
                      SizedBox(height: 10),

                      FlutterRatingBar(
                        initialRating: 4,
                        fillColor: Colors.amber,
                        borderColor: Colors.amber.withAlpha(50),
                        allowHalfRating: true,

                        onRatingUpdate: null,
                      ),

                      SizedBox(height: 20),

                    ],
                  ),

                  SizedBox(height: 20),

                  Column(

                    children:[
                      new MaterialButton(
                        child:
                        Text( "Submitted" , style: TextStyle(color: Colors.grey)),
                        onPressed: (){
                        },
                      ),

                    ]),
                  ],
                ),
            ),
        ),
    );
  }

}

// -- Submit Button -- //

String submitStatus = " Submit ";
Color submitBtnTextColor = Colors.blue;

class SubmitBtn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SubmitButton();

}

class SubmitButton extends State<SubmitBtn> {

  @override
  Widget build(BuildContext context) {
    int allRate = 0;
    return Column(

        children:[
          new MaterialButton(
            child:
            Text( submitStatus , style: TextStyle(color: submitBtnTextColor)),
            onPressed: (){
              setState(() {
                for(int i = 0; i < ratings.length; i++){
                  if(ratings[i] != 0.0){
                    allRate++;
                  }
                }

                if(allRate == ratings.length){
                  submitStatus = "Submitted";
                  submitBtnTextColor = Colors.grey;
                }

              });
            },
          ),

        ]);
  }

}
