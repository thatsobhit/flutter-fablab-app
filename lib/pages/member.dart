import 'package:flutter/material.dart';
import 'package:fablabapp/pallete.dart';
import 'package:fablabapp/widgets/gradient_button.dart';

import '../widgets/custombutton.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const SizedBox(height: 50),
              Text(
                'Are you a member of SOA FabLab?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Pallete.whiteColor,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: VercelButton(
                        onPressed: () {
                          // Handle button press logic here
                        },
                        text: 'Yes',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: VercelButton(
                        onPressed: () {
                          // Handle button press logic here
                        },
                        text: 'No',
                      ),

                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GradientButton(
                onPressed: () {
                  // Handle button press logic here
                  Navigator.pushNamed(context, 'certificates');
                },
                hintText: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
