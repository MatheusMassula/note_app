import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas notas'),
        centerTitle: true,
      ),
      body: Text('Aqui ficará a suas notas'),
    );
  }
}