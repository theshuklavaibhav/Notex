import 'package:flutter/material.dart';
import 'package:notex/notes_provider/Notes_Provider.dart';
import 'package:provider/provider.dart';
import 'package:notex/notes_provider/Notes_Provider.dart';

class AddScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 158, 255),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Add Note',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.white,
      ),
      body: Consumer<NotesProvider>(
        builder: (context, data, child) {
          return Container(
            height: 600,
            
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 255, 250, 209),
              border: Border.all(color: Colors.black)
            ),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      
                    ),
                    label: Text('Enter Title', 
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                    ),
                   selectionColor: Color.fromARGB(255, 0, 0, 0),
                   ),
                  ),
                ),

                const SizedBox(height: 8),

                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Content',
                      style: TextStyle(fontSize: 25),
                      
                    ),

                    border: InputBorder.none,
                    helperMaxLines: 5,
                  ),
                ),

                SizedBox(height: 194),
                FloatingActionButton(
                  onPressed: () {
                    if(titleController.text.isNotEmpty && contentController.text.isNotEmpty){
                      data.addNote(
                      titleController.text,
                      contentController.text,
                    );
                    Navigator.pop(context);
                   }
                  },
                  backgroundColor: Color.fromARGB(255, 31, 158, 255),
                  foregroundColor: Colors.white,
                  child: Icon(Icons.add_home_rounded),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
