import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChangeColor());
}

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  Color _containerColor = Colors.blue;
  double _rotationAngle = 0.0;

  void _ChangeColorRandom() {
    setState(() {
      _containerColor = Color(
        (Random().nextDouble() * 0xFFFFFF).toInt(),
      ).withValues(alpha: 1.0);

      // Har click par 45 degree (pi / 4) ghumega
      _rotationAngle += pi / 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "change color!",
            style: TextStyle(color: Colors.white),
          ),
          actions: const [
            Icon(Icons.search),
            SizedBox(width: 8),
            Icon(Icons.favorite),
            SizedBox(width: 8),
          ],
          leading: const CircleAvatar(
            backgroundColor: Colors.lightBlue,
            child: Text(
              "S",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Center(
          child: GestureDetector(
            onTap: _ChangeColorRandom,
            child: AnimatedRotation(
              // Smooth 2D/3D rotation animation bina gayab hue
              turns: _rotationAngle / (2 * pi),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      blurRadius: 15,
                      offset: const Offset(8, 8),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    "Click me to  rotate & Change Color !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}