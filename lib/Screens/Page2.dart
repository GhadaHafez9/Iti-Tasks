// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("it's Page2"),
    );
  }
}