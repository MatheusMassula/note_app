import 'package:flutter/material.dart';

class NoteRecordPage extends StatefulWidget {
  final String noteText;

  const NoteRecordPage({
    Key key,
    this.noteText,
  }) : super(key: key);

  @override
  _NoteRecordPageState createState() => _NoteRecordPageState();
}

class _NoteRecordPageState extends State<NoteRecordPage> {
  final GlobalKey<FormState> _noteFormKey = GlobalKey<FormState>();
  final TextEditingController _noteController = TextEditingController();
  String _note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nota'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(onPressed: _salvar, child: Text('Salvar'))
        ],
      ),
      body: Form(
        key: _noteFormKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _noteController,
              validator: (nota) => nota == '' ? 'Insira algum valor para ser anotado' : null,
              onSaved: (nota) => nota,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Nota',
                isDense: true,
                contentPadding: EdgeInsets.all(10),
                alignLabelWithHint: true
              ),
            ),
          ]
        )
      )
    );
  }

  void _salvar() {
    if(_noteFormKey.currentState.validate()) {
      _noteFormKey.currentState.save();
      _note = _noteController.text;
      Navigator.pop(context, _note);
    }
  }
}