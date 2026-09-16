import 'package:flutter/material.dart';

void main() {
  runApp(const ChangeColor());
}

class ChangeColor extends StatelessWidget {
  const ChangeColor({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
 home : Scaffold(
  appBar: AppBar (
    title: const Text('Change Color'),

  ),
  body:const Center(
    child: Text('Hello Shivam',
    style: TextStyle(
      fontSize: 30,
      color: Colors.red,
    ),
    ),
  
  
  
  ),
 ),

    );
  }
}