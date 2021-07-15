import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
//import 'package:notes/create_note_page.dart';

import 'custom_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["First Item"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              CustomCard(
                  text: notes[i],
                  onTap: () async {
                    var response = await Navigator.pushNamed(
                        context, "/create-note",
                        arguments: notes[i]);
                    if (response != null) {
                      var description = response as String;
                      if (response.isEmpty) {
                        notes.remove(notes[i]);
                      } else {
                        notes[i] = description;
                      }
                      setState(() {});
                    }
                  })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var description =
          await Navigator.pushNamed(context, "/create-note");
          if (description != null) {
            notes.add(description as String);
            setState(() {});
          }
        }),
    );
  }
}