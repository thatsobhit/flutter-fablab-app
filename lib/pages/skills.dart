import 'package:flutter/material.dart';
import 'package:fablabapp/pallete.dart';
import 'package:fablabapp/widgets/gradient_button.dart';

class SkillsScreen extends StatelessWidget {
   SkillsScreen({Key? key}) : super(key: key);

  final List<String> hardwareSkills = [
    'Arduino',
    'Raspberry Pi',
    'Circuit Design',
    'Robotics',
    'Sensor Integration',
  ];

  final List<String> softwareSkills = [
    'Web Development',
    'Mobile App Development',
    'Database Management',
    'Data Analysis',
    'Machine Learning',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const SizedBox(height: 50),
              const Text(
                'Select Your Skills',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Pallete.whiteColor,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Text(
                      'Hardware Skills',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Pallete.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: hardwareSkills.map((skill) {
                        return ChoiceChip(
                          label: Text(
                            skill,
                            style: const TextStyle(color: Pallete.whiteColor),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            // Handle selection logic here
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Software Skills',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Pallete.whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: softwareSkills.map((skill) {
                        return ChoiceChip(
                          label: Text(
                            skill,
                            style: const TextStyle(color: Pallete.gradient2),
                          ),
                          selected: false,
                          onSelected: (selected) {
                            // Handle selection logic here
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              GradientButton(
                onPressed: () {
                  // Handle button press logic here
                  Navigator.pushNamed(context, 'member');
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
