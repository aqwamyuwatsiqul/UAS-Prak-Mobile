import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/categories.dart';
import 'package:project_uas/onboarding.dart';
import 'Page/CartPage.dart';
import 'firebase_options.dart';

late FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter Sederhana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onboarding(),
      routes: {
        "cartPage": (context) => CartPage(),
      },
    );
  }
}
