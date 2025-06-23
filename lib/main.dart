import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:notex/notes_provider/Notes_Provider.dart';
import 'Screens/home_screen.dart';
import 'Screens/add_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: MaterialApp(
        title: 'Note Taking App',
        
        home: Homescreen(),
        
      ),
    );
  }
}
