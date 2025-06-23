import 'package:flutter/material.dart';
import 'package:notex/models/note_model.dart';


class NotesProvider extends ChangeNotifier {
  //--------------------Making List is Note--------------------------|

  List<Note> _note = [];

  //------------------------Get Notes----------------------------------|

  List<Note> get getNote => _note;
  
  NotesProvider(){
    addNote('First Note', 'This is First Note Content');
    addNote('Second Note', 'This is Second Note Content');
  }

  //------------------------Add Notes-----------------------------------|

  void addNote(String title, String content) {
    final newNote = Note(title: title, content: content);
    getNote.add(newNote);

    

    notifyListeners();
  }

  //---------------------Remove Note Event----------------------------------------|

  void deleteNote(int index) {
    _note.removeAt(index);
    notifyListeners();
  }
}



//---------------------------Edit Note-------------------------------------------|






