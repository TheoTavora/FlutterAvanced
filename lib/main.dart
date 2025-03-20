import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<String> nomes = ['Rodrigo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              listKey.currentState!.insertItem(
                0,
                duration: Duration(milliseconds: 500),
              );
              setState(() {
                nomes =
                    []
                      ..add('Test')
                      ..addAll(nomes);
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 22),
          GestureDetector(
            onTap: () {
              listKey.currentState!.removeItem(
                0,
                (context, animation) => slideTransition(context, 0, animation),
                duration: Duration(milliseconds: 500),
              );
              setState(() {
                nomes.removeAt(0);
              });
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
      body: SafeArea(
        child: AnimatedList(
          key: listKey,
          initialItemCount: nomes.length,
          itemBuilder: slideTransition,
        ),
      ),
    );
  }

  Widget slideTransition(
    BuildContext context,
    int index,
    Animation<double> animation,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(-1, 0),
        end: Offset(0, 0),
      ).animate(animation),
      child: ListTile(
        title: Text(nomes[index]), // Agora a variável "nomes" está acessível
      ),
    );
  }
}
