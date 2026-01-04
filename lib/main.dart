import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/cupertino_home.dart';
import 'screens/material_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isMaterial = true;

  void _togglePlatform() {
    setState(() {
      _isMaterial = !_isMaterial;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isMaterial) {
      return MaterialApp(
        title: 'E-Commerce Android',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: MaterialHome(onToggle: _togglePlatform),
      );
    } else {
      return CupertinoApp(
        title: 'E-Commerce iOS',
        theme: const CupertinoThemeData(
          primaryColor: CupertinoColors.activeBlue,
        ),
        home: CupertinoHome(onToggle: _togglePlatform),
      );
    }
  }
}
