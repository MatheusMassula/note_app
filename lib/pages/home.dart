import 'package:flutter/material.dart';
import 'package:note_app/pages/note_record_page.dart';
import 'package:note_app/widgets/note_preview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas notas'),
        centerTitle: true,
      ),
      body: _buildNoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String note = await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => NoteRecordPage())
          );
          setState(() {
            _notes.add(note);
          });
        },
        child: Icon(Icons.add)
      ),
    );
  }

  Widget _buildNoteList() {
    return _notes.length > 0 ?
    GridView.builder(
      itemCount: _notes.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 175.0),
      itemBuilder: (BuildContext context, int index) {
        return NotePreview(noteText: _notes[index]);
      }
    ) :
    Center(child: Text('Não existem notas cadastradas ainda.'));

  }
  
}