// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/Screens/home_screen.dart';
import 'package:flutter_application_2/views/Screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final _formKey = GlobalKey<FormState>();
   bool insecurepass = true;
   TextEditingController usernamecontroller = TextEditingController();
   TextEditingController passwordController = TextEditingController();
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
                 obscureText: insecurepass,
                    obscuringCharacter: "*",
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
                   // bool result = await fireBaseLogin(usernamecontroller.text, passwordController.text);
                   //   if (result == true) {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('username', usernamecontroller.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeScreen(
                          username: usernamecontroller.text,)));
                     // }
                   // else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content:  Text("Success")));
                  
                   // }
                   }},
                  child:   Text(' Log In '),
                ),
  
  
  
            
                SizedBox(height: 15),
                
            
            
            
            
                Text( "Forget passward? ", 
                          style: TextStyle(color: Colors.brown , fontSize: 15 ),
                      ),
            
            
            
                SizedBox(height: 200),
                CupertinoButton.filled(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignUpScreen()));
                  
                  },
                  child: const Text('No Account? Sign up Now !'),
                ),
               
          ],
         ),
       ),
     )

    );
  }
  //  Future<bool> fireBaseLogin(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //     if (userCredential.user != null) {
  //       return true;
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  //   return false;
  // }
}