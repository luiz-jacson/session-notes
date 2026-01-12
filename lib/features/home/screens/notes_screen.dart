import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:session_notes/core/widgets/add_note_modal.dart';
import 'package:session_notes/core/widgets/finish_session_modal.dart';
import 'package:session_notes/core/widgets/note_card.dart';
import 'package:session_notes/models/note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  Future<List<NoteCard>> getNotes() async {
    Note nota1 = Note("Anotação 1");
    Note nota2 = Note("Anotação 2");
    List<Note> listaNotas = [nota1, nota2];
    List<NoteCard> listaCards = [];
    for (var note in listaNotas) {
      NoteCard card = NoteCard(note: note);
      listaCards.add(card);
    }
    return listaCards;
  }

  Future<void> _refreshNotes() async {
    setState(() {
      getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Minhas Notas",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            Text(
              "0 anotações",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
            ),
          ],
        ),
        leadingWidth: 40,
        leading: Container(
          margin: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          width: 96,
          height: 96,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF568C72).withOpacity(0.15),
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/images/leaf.svg',
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Color(0xFF568C72),
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 2,
              side: BorderSide(width: 0.06, color: Colors.grey),
            ),
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return FinishSessionModal();
                },
              ),
            },
            child: Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(width: 8.0),
                Text("Finalizar sessão"),
              ],
            ),
          ),
          SizedBox(width: 8),
        ],
        backgroundColor: Colors.white10,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: Colors.grey.shade300),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: RefreshIndicator(
          onRefresh: _refreshNotes,
          child: FutureBuilder(
            future: getNotes(),
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (asyncSnapshot.hasError) {
                return Center(child: Text("Erro ao carregar notas"));
              }

              if (!asyncSnapshot.hasData || asyncSnapshot.data!.isEmpty) {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF568C72).withOpacity(0.15),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/leaf.svg',
                            width: 48,
                            height: 48,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF568C72),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Sua sessão está vazia",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Anote pensamentos, sentimentos ou assuntos que deseja lembrar para sua próxima terapia.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                );
              }

              final listaNotas = asyncSnapshot.data!;

              return GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1.1,
                children: listaNotas,
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AddNoteModal();
            },
          );
        },
        shape: CircleBorder(),
        backgroundColor: const Color(0xFF568C72),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
