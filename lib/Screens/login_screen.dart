// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final _formKey = GlobalKey<FormState>();
   TextEditingController usernamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     appBar: AppBar(
      //backgroundColor: Colors.grey,
     ),
     body: Form(
      key: _formKey ,
       child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30) ,

             Container(
                width: 100,
                height: 100,
                child: Image.asset("assets/download (1).png"),
            
             ),
          
            
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: usernamecontroller ,
              decoration:  InputDecoration(labelText: "Username"),
              validator: (value) {
                  if (value == null || value.contains("@")== false) {
                    return "Enter valid Username ";
                  }
                },
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration:  InputDecoration(labelText:"Password" ),
                validator: (value) {
                  if (value == null || value.length <9) {
                    return "Enter valid Passward ";
                  }
                },
              ),
            ),
          
            
            
           
              SizedBox(height: 30),
                CupertinoButton.filled(
                  onPressed: () async { if (_formKey.currentState!.validate()) {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('username', usernamecontroller.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeScreen(
                          username: usernamecontroller.text,)));
                    
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:  Text("Success")));
                    }},
                  child:   Text(' Log In '),
                ),
            
                SizedBox(height: 15),
                
            
            
            
            
                Text( "Forget passward? ", 
                          style: TextStyle(color: Colors.brown , fontSize: 15 ),
                      ),
            
            
            
                SizedBox(height: 200),
                CupertinoButton.filled(
                  onPressed: () {},
                  child: const Text('Create new account'),
                ),
               
          ],
         ),
       ),
     )

    );
  }
}