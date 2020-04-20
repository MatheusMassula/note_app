import 'package:flutter/material.dart';
import 'package:flutter_note_app/pages/note_record_page.dart';
import 'package:flutter_note_app/services/storage.dart';
import 'package:flutter_note_app/widgets/note_preview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Storage _storage = Storage();
  List<String> _notes = [];

  @override
  void initState() {
    super.initState();
    _storage.getnotes().then((noteList) {
      setState(() {
        _notes.addAll(noteList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildNoteList(),
      floatingActionButton: _buildAddNoteButton(context),
    );
  }

  FloatingActionButton _buildAddNoteButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        String note = await Navigator.push(context, MaterialPageRoute(builder: (context) => NoteRecordPage()));
        if(note != null) {
          setState(() {
            _notes.add(note);
          });
          _storage.saveNotes(notes: _notes);
        }
      },
      child: Icon(Icons.add),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Minhas notas'),
      centerTitle: true,
    );
  }

  Widget _buildNoteList() {
    return _notes.length > 0 ?
    GridView.builder(
      itemCount: _notes.length,
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 175.0),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () async {
            String note = await Navigator.push(context, MaterialPageRoute(builder: (context) => NoteRecordPage(noteText: _notes[index])));
            
            if(note != null) {
              setState(() {
                _notes[index] = note;
              });
              _storage.saveNotes(notes: _notes);
            }
          },
          child: NotePreview(noteText: _notes[index]),
        );
      }
    ) :
    Center(child: Text('Não existem notas cadastradas ainda'));
  }
}