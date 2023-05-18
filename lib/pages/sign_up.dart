import 'package:fablabapp/pallete.dart';
import 'package:flutter/material.dart';
import 'package:fablabapp/widgets/gradient_button.dart';
import 'package:fablabapp/widgets/login_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController _Controller = TextEditingController();

  bool validateEmail(String email) {
    String pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              // const Text(
              //   'Sign Up.',
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: ,
              //     color: Pallete.whiteColor,
              //   ),
              // ),
              const SizedBox(height: 5),
              ColorFiltered(
                colorFilter:
                const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn),
              ),
              const SizedBox(height: 50),
              LoginField(
                hintText: 'Name',
                customIcon: Icons.person,
                customIconColor: Pallete.whiteColor,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'Email',
                customIcon: Icons.mail,

                customIconColor: Pallete.whiteColor,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'Phone',
                customIcon: Icons.phone,

                customIconColor: Pallete.whiteColor,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'Password',
                customIcon: Icons.fingerprint_outlined,

                customIconColor: Pallete.whiteColor,
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              LoginField(
                hintText: 'Re-Password',
                customIcon: Icons.fingerprint_outlined,

                customIconColor: Pallete.whiteColor,
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              GradientButton(
                onPressed: () {
                  final email = emailController.text;
                  final password = passwordController.text;
                  Navigator.pushNamed(context, 'skill');
                },
                hintText: 'Continue',
              ),
              TextButton(
                  onPressed:(){
                    Navigator.pushNamed(context, 'register');
                  },
                  child: Text("Log-in")
              ),
            ],
          ),
        ),
      ),
    );
  }
}