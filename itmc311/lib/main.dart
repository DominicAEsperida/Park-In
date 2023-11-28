import 'package:flutter/material.dart';
import 'package:itmc311/Pages/LandingPage.dart';
import 'package:itmc311/Pages/GuidePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park-In',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: 'BubbleboddyNeue'),
      home: const RootPage(),
      routes: {
        '/help': (context) => const GuidePage(),
        '/logout': (context) => const RootPage(),
      },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingPage(),
    );
  }
}
