import 'package:flutter/material.dart';
import 'package:session_notes/features/home/screens/notes_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SessionNotesApp());
}

class SessionNotesApp extends StatelessWidget {
  const SessionNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF568C72),
          primary: const Color(0xFF568C72),
        ),
      ),
      routes: {"home": (context) => NotesScreen()},
      initialRoute: "home",
    );
  }
}
