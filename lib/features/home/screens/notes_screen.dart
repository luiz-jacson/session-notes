import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

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
            onPressed: () => {},
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
        child: SingleChildScrollView(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Text("Olá");
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
