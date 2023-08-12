// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';
import 'Page5.dart';

class HomeScreen extends StatefulWidget {
  String username;
  HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> pages = [Page1() , Page2(), Page3(), Page4() , Page5()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        //backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
      
        },icon:Icon(Icons.arrow_back_ios ),),

      ),
      body : pages[currentIndex] ,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex : currentIndex ,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label:" page1" , backgroundColor: Colors.blueAccent ),
         BottomNavigationBarItem(icon: Icon(Icons.ondemand_video_rounded), label:" page2" , backgroundColor:  Colors.blueAccent ),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label:" page3", backgroundColor: Colors.blueAccent  ),
           BottomNavigationBarItem(icon: Icon(Icons.notifications), label:" page4" ,  backgroundColor:  Colors.blueAccent),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label:" page5" , backgroundColor: Colors.blueAccent),
          
      ],
      onTap: (value){
        currentIndex = value ;
        setState(() {});
        print(value);
      },
      ),
    );
  }
}