import 'package:flutter/material.dart';
import 'package:notex/notes_provider/Notes_Provider.dart';
import 'package:provider/provider.dart';
import 'package:notex/models/note_model.dart';
import 'add_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'NoteX',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),

      body: Consumer<NotesProvider>(
        builder: (context, NotesProvider data, child) {
          if (data.getNote.isNotEmpty) {
            return ListView.builder(
              itemCount: data.getNote.length,
              itemBuilder: (context, index) {
                return NoteCard(data.getNote[index], index);
                // data is a argument representing NoteProvider
              }
            );
          } else {
            return
            Center(
              child: Text('No Notes Available',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255)
              ),
              
             ),
            
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: Icon(Icons.add,),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final Note note;
  final int index;

  NoteCard(this.note, this.index);

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note.title,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
               IconButton(
                onPressed: () {
                  notesProvider.deleteNote(index);
                },
                icon: Icon(Icons.delete_forever_rounded),
              ),
            ],
          ),
          Text(
            note.content,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
