import 'package:bmi_cal/constant.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int height = 150;
  int weight = 70;
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
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text("Male"),
                            Icon(Icons.male,
                                size: 150, color: Colors.lightBlueAccent),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("Female"),
                          Icon(Icons.female,
                              size: 150, color: Colors.pinkAccent),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text("Height(cm)"),
                            Text(
                              "$height",
                              style: const TextStyle(
                                  fontSize: 64, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height >= 50) {
                                        height--;
                                        bmi = calculate(
                                            height: height, weight: weight);
                                      }
                                    });
                                    print(height);
                                  },
                                  child:const Icon(Icons.remove),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      if (height <= 300) {
                                        height++;
                                        bmi = calculate(
                                            height: height, weight: weight);
                                      }
                                    });
                                  },
                                  child:const Icon(Icons.add),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Text("Weight(Kg)"),
                          Text(
                            "$weight",
                            style: const TextStyle(
                                fontSize: 64, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight >= 10) {
                                      weight--;
                                      bmi = calculate(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child: const Icon(Icons.remove),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight <= 500) {
                                      weight++;
                                      bmi = calculate(
                                          height: height, weight: weight);
                                    }
                                  });
                                },
                                child:const Icon(Icons.add),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  "BMI",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 64,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: ktheme, // Updated gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "${bmi.toStringAsFixed(2)}",
                      style:
                          const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                    ))),
                Text(result(bmi))
              ],
            ),
          ),
        ));
  }

  double calculate({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String result(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }
}
