import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Color(0xFF568C72), // verde sálvia
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text("Sua sessão está vazia", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600),),
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
