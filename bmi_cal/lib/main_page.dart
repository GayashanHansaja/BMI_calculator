import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: const Text('BMI Calculator'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFB6C1), Color(0xFFADD8E6)],
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
                 children:[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child:Center(
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
                        children:  [
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
                      padding:EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text("Height"),
                            Text(
                              "170",
                              style: TextStyle(
                                  fontSize: 64, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Icons.add),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Icons.remove),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                     Spacer(),
                    Padding(
                      padding:  EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text("Width"),
                          Text(
                            "70",
                            style: TextStyle(
                                fontSize: 64, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              FloatingActionButton(
                                onPressed: null,
                                child: Icon(Icons.add),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              FloatingActionButton(
                                onPressed: null,
                                child: Icon(Icons.remove),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Text(
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
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFFB6C1),
                            Color(0xFFADD8E6)
                          ], // Updated gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "20",
                      style:
                          TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
                    ))),
              ],
            ),
          ),
        ));
  }
}
