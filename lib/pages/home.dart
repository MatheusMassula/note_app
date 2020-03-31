import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_preview.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas notas'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(100, (index) {
          return NotePreview(noteText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('redirecionar para página de criação de nota');
          //TODO: Criar página de criação/ visualisação de nota
        },
        child: Icon(Icons.add)
      ),
    );
  }
}