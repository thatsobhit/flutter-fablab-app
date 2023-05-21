import 'package:fablabapp/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fablabapp/widgets/gradient_button.dart';
import 'package:fablabapp/widgets/login_field.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  late final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> loggedin(_email, _password) async {
    late String email = _email;
    late String password = _password;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          padding: EdgeInsets.all(20),
          content: Text('Login Successful'),
          leading: Icon(Icons.agriculture_outlined),
          backgroundColor: Colors.green,
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: Text('Dismiss'),
            ),
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          padding: EdgeInsets.all(20),
          content: Text('Login Unsuccessful: ${e.code}'),
          leading: Icon(Icons.agriculture_outlined),
          backgroundColor: Colors.red,
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
              child: Text('Dismiss'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/images/signin_balls.png'),
                const Text(
                  'Sign in.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Pallete.whiteColor,
                  ),
                ),
                const SizedBox(height: 50),
                Lottie.network(
                  "https://assets1.lottiefiles.com/packages/lf20_rj4titti.json",
                  width: 200,
                  height: 200,
                ),
                // ColorFiltered(
                //   colorFilter:
                //   const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn),
                //   child: SvgPicture.asset(
                //     'assets/svgs/splash.svg',
                //     fit: BoxFit.contain,
                //     width: 200,
                //     height: 200,
                //   ),
                // ),
                const SizedBox(height: 50),
                LoginField(
                  hintText: 'Email',
                  customIcon: Icons.mail,
                  customIconColor: Pallete.whiteColor,
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                LoginField(
                  hintText: 'Password',
                  customIcon: Icons.fingerprint_outlined,
                  customIconColor: Pallete.whiteColor,
                  controller: passwordController,
                  validator: (value) =>
                      value!.length < 6 ? 'Please enter some text' : null,
                ),
                const SizedBox(height: 20),
                GradientButton(
                  onPressed: () {
                    if (loginKey.currentState!.validate()) {
                      loggedin(emailController.text, passwordController.text)
                          .then(
                              (value) => Navigator.pushNamed(context, 'home'));
                    }
                  },
                  hintText: 'Sign in',
                ),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, 'register'),
                  child: Text("Sign Up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
