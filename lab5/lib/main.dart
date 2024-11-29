// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const _size = 25.0; // Розмір пікселя
const _bgColor = Colors.yellow; // Колір пікселя
const _borderColor = Colors.grey; // Колір границі
const _borderWidth = 1.0; // Розмір границі
const _borderRadius = 5.0; // Радіус кутка

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digit 3',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Digit 3'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildThree(),
        ),
      ),
    );
  }

  List<Widget> _buildThree() {
    return [
      _buildRow([1, 1, 1, 0]), // Верхній рядок
      _buildRow([0, 0, 0, 1]), // Другий рядок
      _buildRow([1, 1, 1, 0]), // Третій рядок
      _buildRow([0, 0, 0, 1]), // Четвертий рядок
      _buildRow([0, 0, 0, 1]), // Четвертий рядок
      _buildRow([1, 1, 1, 0]), // Нижній рядок
    ];
  }

  Widget _buildRow(List<int> pixels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pixels.map((pixel) {
        return pixel == 1 ? _buildDot() : _buildEmpty();
      }).toList(),
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor, // Колір пікселя
        borderRadius: BorderRadius.circular(_borderRadius), // Радіус кутка
        border: Border.all(
          color: _borderColor, // Колір границі
          width: _borderWidth, // Товщина границі
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return SizedBox(
      width: _size,
      height: _size,
    );
  }
}