import 'package:bentayan/customer/member/member_layout.dart';
import 'package:flutter/material.dart';
import 'login/login.dart';
import 'stall_owner/stall_owner_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      //home: MemberLayout(0),
    );
  }
}
