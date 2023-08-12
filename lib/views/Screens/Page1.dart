// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String username = "";
  getCashedUsername () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   username= prefs.getString("username") ??'--';
    setState(() { });
  }
  @override
  void initState() {
    super.initState();
    getCashedUsername();
  }
  Widget build(BuildContext context) {
    return Center(
      child: Text("it's Page1 \n $username"),
    );
  }
}