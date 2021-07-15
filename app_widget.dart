import 'package:flutter/material.dart';

import 'create_note_page.dart';
import 'home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        title: "Notes",
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: {
          "/home": (context) => HomePage(),
          "/create-note": (context) => CreateNotePage()
        });
  }
}



