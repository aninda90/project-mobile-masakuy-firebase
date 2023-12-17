import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:masakuy_api/splashscreen.dart';

late final FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyDH8R5YL_BMNUfeddhHG6d8T-PeMUVDcYU", 
    appId: "1:1082672741626:android:511d3d5867440804431d43" , 
    messagingSenderId: "1082672741626", 
    projectId: "masakuy-92c3c"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masakuy',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: SplashScreen(),
    );
  }
}
