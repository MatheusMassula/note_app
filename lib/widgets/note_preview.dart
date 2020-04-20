import 'package:flutter/material.dart';

class NotePreview extends StatelessWidget {
  final String noteText;

  const NotePreview({
    Key key,
    this.noteText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _boxDimenssions = _size.height > _size.width ? _size.width / 4 : _size.height / 4;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        height: _boxDimenssions,
        width: _boxDimenssions,
        child: Text(noteText),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Colors.grey
          )
        ),
      ),
    );
  }
}