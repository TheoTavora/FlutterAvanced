import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool animate = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: AnimatedContainer (
          duration: Duration(milliseconds: 400),
          height: animate ? height : 50,
          width: animate ? width : 50,
          color: animate ? Colors.blue : Colors.red,
          curve: Curves.decelerate
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState (() {
            animate = true;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
