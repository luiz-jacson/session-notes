import 'package:flutter/material.dart';

class FinishSessionModal extends StatefulWidget {
  const FinishSessionModal({super.key});

  @override
  State<FinishSessionModal> createState() => _FinishSessionModalState();
}

class _FinishSessionModalState extends State<FinishSessionModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(
          "Finalizar sessão?",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      content: Text(
        "Ao finalizar, uma nova sessão começará vazia.",
        style: TextStyle(fontSize: 12, color: Colors.grey),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              side: BorderSide(width: 0.06, color: Colors.grey),
              backgroundColor: Colors.white,
              fixedSize: Size(MediaQuery.of(context).size.width, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
            ),
            onPressed: () => {Navigator.of(context).pop()},
            child: Text(
              "Continuar anotando",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF568C72),
              elevation: 2,
              fixedSize: Size(MediaQuery.of(context).size.width, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
            ),
            onPressed: () => {},
            child: Text("Sim, finalizar", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
