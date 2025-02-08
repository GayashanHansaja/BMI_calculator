import 'package:bmi_cal/constant.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int height = 150;
  int weight = 70;
  Gender? selectedGender;
  late double bmi = calculate(height: height, weight: weight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: ktheme,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _GenderSelection(
                      icon: Icons.male,
                      label: "Male",
                      isSelected: selectedGender == Gender.male,
                      onTap: () => setState(() => selectedGender = Gender.male),
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Expanded(
                    child: _GenderSelection(
                      icon: Icons.female,
                      label: "Female",
                      isSelected: selectedGender == Gender.female,
                      onTap: () => setState(() => selectedGender = Gender.female),
                      color: Colors.pinkAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _NumberControl(
                      label: "Height(cm)",
                      value: height,
                      min: 50,
                      max: 300,
                      onDecrement: () => setState(() {
                        if (height > 50) {
                          height--;
                          bmi = calculate(height: height, weight: weight);
                        }
                      }),
                      onIncrement: () => setState(() {
                        if (height < 300) {
                          height++;
                          bmi = calculate(height: height, weight: weight);
                        }
                      }),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _NumberControl(
                      label: "Weight(kg)",
                      value: weight,
                      min: 10,
                      max: 500,
                      onDecrement: () => setState(() {
                        if (weight > 10) {
                          weight--;
                          bmi = calculate(height: height, weight: weight);
                        }
                      }),
                      onIncrement: () => setState(() {
                        if (weight < 500) {
                          weight++;
                          bmi = calculate(height: height, weight: weight);
                        }
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "BMI",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: ktheme,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    bmi.toStringAsFixed(2),
                    style: kInputStyle,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                result(bmi),
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _getBmiColor(bmi),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculate({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String result(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return "Normal weight";
    if (bmi < 30) return "Overweight";
    return "Obesity";
  }

  Color _getBmiColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }
}

class _GenderSelection extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const _GenderSelection({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : null,
          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(label),
            Icon(icon, size: 100, color: color),
          ],
        ),
      ),
    );
  }
}

class _NumberControl extends StatelessWidget {
  final String label;
  final int value;
  final int min;
  final int max;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _NumberControl({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          Text(label),
          Text(
            "$value",
            style: kInputStyle,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: null,
                onPressed: value > min ? onDecrement : null,
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 15),
              FloatingActionButton(
                heroTag: null,
                onPressed: value < max ? onIncrement : null,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}