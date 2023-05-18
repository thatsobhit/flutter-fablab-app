import 'package:fablabapp/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fablabapp/widgets/gradient_button.dart';
import 'package:fablabapp/widgets/login_field.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Lottie.network("https://assets1.lottiefiles.com/packages/lf20_rj4titti.json",
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
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                customIcon: Icons.fingerprint_outlined,

                customIconColor: Pallete.whiteColor,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                },
                hintText: 'Sign in',
              ),
              TextButton(
                  onPressed:(){
                    Navigator.pushNamed(context, 'register');
                  },
                  child: Text("Sign Up")
              ),
            ],
          ),
        ),
      ),
    );
  }
}