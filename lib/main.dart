import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:imperia/view/screens/home.dart';
import 'package:imperia/view/screens/login.dart';
import 'package:imperia/viewmodel/auth/auth_viewmodel.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imperia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const InitialNavigation(),
    );
  }
}

class InitialNavigation extends StatefulWidget {
  const InitialNavigation({super.key});

  @override
  State<InitialNavigation> createState() => _InitialNavigationState();
}

class _InitialNavigationState extends State<InitialNavigation> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          print(snapshot);
            return HomePage();
          } else {
            return const LoginPage();
          }
        });
  }
}
