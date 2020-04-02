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
  TextEditingController _noteController;
  String _note;

  @override
  void initState() {
    super.initState();
    _note = widget.noteText;
     _noteController = TextEditingController(text: _note);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color(0xFF4C54B9)
          ),
          onPressed: () => Navigator.pop(context)
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: _salvar,
            child: Text('Salvar', style: TextStyle(color: const Color(0xFF4C54B9)))
          )
        ],
      ),
      body: _buildNoteInput()
    );
  }

  Form _buildNoteInput() {
    return Form(
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