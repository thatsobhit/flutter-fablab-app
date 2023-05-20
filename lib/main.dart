import 'dart:async';

import 'package:fablabapp/pages/certification.dart';
import 'package:fablabapp/pages/home_nav.dart';
import 'package:fablabapp/pages/login.dart';
import 'package:fablabapp/pages/member.dart';
import 'package:fablabapp/pages/sign_up.dart';
import 'package:fablabapp/pages/skills.dart';
import 'package:fablabapp/pallete.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //! declare firebase options here
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Fablabapp());
}

class Fablabapp extends StatefulWidget {
  const Fablabapp({super.key});

  @override
  State<Fablabapp> createState() => _FablabappState();
}

class _FablabappState extends State<Fablabapp> {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
  late StreamSubscription<User?> user;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((event) {});
  }

  @override
  void dispose() {
    super.dispose();
    user.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: true,
              home: FirebaseAuth.instance.currentUser == null
                  ? const LoginScreen()
                  : HomeScreen(),
              theme: ThemeData(
                useMaterial3: true,
                scaffoldBackgroundColor: Pallete.backgroundColor,
                inputDecorationTheme: const InputDecorationTheme(
                  hintStyle: TextStyle(
                    color: Pallete.whiteColor, // Set the desired hintText color
                  ),
                ),
              ),
              routes: {
                'register': (context) => const SignupScreen(),
                'login': (context) => const LoginScreen(),
                'home': (context) => HomeScreen(),
                'skill': (context) => SkillsScreen(),
                'member': (context) => const MembershipScreen(),
                'certificates': (context) => const CertificateInputPage(),
              });
        }
        return CircularProgressIndicator();
      },
    );
  }
}
