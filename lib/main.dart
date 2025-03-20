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
      debugShowCheckedModeBanner: false,
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
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Stack(
         children: [
          AnimatedPositioned(
          child: Container(
            color: Colors.red,
            height: 50,
            width: 50,
          ),
          left: animate ? width : 0,
          top: 100,
          duration: Duration(milliseconds: 5000),
        ),
        Positioned(
          top: 150,
          left: 0,
          child: Container(
            color: Colors.black,
            width: width,
            height: 3,
          ),
        )
        ], 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState (() {
            if (animate) {
              animate = false;
            } else {
              animate = true;
            }
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
