// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyUm());
}

class MyUm extends StatelessWidget {
  const MyUm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyUM"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: <Widget>[
          const Text("Dashboard"),
          Text("Page ${currentIndex}"),
          Text("Page ${currentIndex}"),
          Text("Page ${currentIndex}")
        ][currentIndex], // <Widget>[]
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: <Widget>[
          // First destination 0
          const NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: "Dashboard",
          ), // NavigationDestination
          
          // Second Navigation 1
          const NavigationDestination(
            icon: Icon(Icons.pages),
            label: "Page 1",
          ), // NavigationDestination
          
          // Third Navigation 2
          const NavigationDestination(
            icon: Icon(Icons.school),
            label: "Page 2",
          ), // NavigationDestination
          
          // Fourth Navigation 3
          const NavigationDestination(
            icon: Icon(Icons.sports_basketball),
            label: "Page 3",
          ), // NavigationDestination
        ],
      ), // NavigationBar
    ); // Scaffold
  }
}