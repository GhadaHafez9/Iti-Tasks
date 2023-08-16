import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/Screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
 // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facebook',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
