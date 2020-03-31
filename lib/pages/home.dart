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
      body: NotePreview(noteText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi et porttitor ligula. Aliquam erat volutpat. Suspendisse eget aliquet eros. Donec commodo pharetra tellus, condimentum egestas velit sodales sed. Donec facilisis sem quis dapibus vulputate. Quisque iaculis viverra lacinia. Morbi dapibus lorem orci, sit amet vestibulum est vestibulum eget. Cras dictum ultrices vehicula. Mauris elementum non neque molestie euismod. Mauris at orci vel sapien feugiat ultricies. Curabitur sagittis pellentesque est, ac consectetur nunc hendrerit ac. Quisque ullamcorper enim odio, eu luctus libero ultricies sed. Cras a sollicitudin turpis, ut aliquet velit. Donec ut auctor nisl.'),
    );
  }
}