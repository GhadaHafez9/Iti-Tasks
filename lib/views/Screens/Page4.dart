// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/user_model.dart';
import 'package:flutter_application_2/Service/user_service.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}



class _Page4State extends State<Page4> {
  List<UserModel> users = [];
  bool isLoading = true ;


  getMyUsers() async {
  users = await UserService() .getUsers() ;
  isLoading = false ;
  setState(() {
    
  });
}
@override
  void initState (){
    super.initState() ;
    getMyUsers() ;
  }
  @override

  Widget build(BuildContext context) {
    return isLoading ?
    Center(child: CircularProgressIndicator(),)
    
     : ListView.builder(itemCount:users .length
    , itemBuilder : (BuildContext context ,int  index) {
      return ListTile(
        title: Text (users[index].name ??'--'),
        subtitle: Text(users[index].email ?? '--'),
        trailing: Icon(Icons.person),
        leading: Text("${index + 1}"),
      );
    },
    );
  }
}