import 'package:flutter/material.dart';

Future<bool> showConfirmation(BuildContext context, String title, String message, {VoidCallback confirm, String button = 'OK'}) async {
  // flutter defined function
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: new Text(button),
            onPressed: () {
              Navigator.of(context).pop(true);
              if(confirm != null){
                confirm();
              }
            },
          ),
        ],
      );
    },
  ) ?? false;
}