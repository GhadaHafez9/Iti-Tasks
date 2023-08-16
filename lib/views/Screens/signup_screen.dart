import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/Screens/login_screen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool insecurepass = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController confirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 150),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 340,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Your Name",
                        prefixIcon: Icon(Icons.person),
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      labelText: "Enter Your Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                    ),
                    validator: (value) {
                      if (value == null  || value.contains("@") == false) {
                        return "Enter Valid Email";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passcontroller,
                    decoration: InputDecoration(
                      labelText: " Make your Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: togglePassword(),
                    ),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                    ),
                    obscureText: insecurepass,
                    obscuringCharacter: "*",
                    validator: (value) {
                      if (value == null  || value.length <= 8) {
                        return "Enter Valid Password";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: togglePassword(),
                    ),
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                    ),
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value) {

                        if (value == null) {
                        return "Enter Valid password";
                      } else if (value != passcontroller.text) {
                        return " password mismatch";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () async {



                        if (_formKey.currentState!.validate()) {
                          bool result =  await register(emailcontroller.text,passcontroller.text);
                          if(result==true){

                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Successful registration")));

                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return LoginScreen ();

                            }));

                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Error,try again"))
                            );
                          }
                        }
                      },






                      child: Text("Register" ,
                        style: TextStyle(color: Colors.white),),
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 79, vertical: 10)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))))),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void showsnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message)));
  }

  Future<bool> register( String email, String password) async {
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,

      );

      if(userCredential.user !=null){
        return true;
      }
    }

    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showsnackbar(context,"The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        showsnackbar(context,"The account already exists for that email." );
      }

    }
    return false;
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          insecurepass = !insecurepass;
        });
      },
      icon: insecurepass ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}