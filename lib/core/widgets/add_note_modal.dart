import 'package:flutter/material.dart';

class AddNoteModal extends StatefulWidget {
  const AddNoteModal({super.key});

  @override
  State<AddNoteModal> createState() => _AddNoteModalState();
}

class _AddNoteModalState extends State<AddNoteModal> {
  final TextEditingController _note = TextEditingController();
  bool isLoading = false;

  void onSave() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Nova anotação", style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancelar", style: TextStyle(color: Colors.grey),),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Expanded(
            child: TextField(
              controller: _note,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                hintText: 'O que você quer lembrar?',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
          ),

          const SizedBox(height: 12),

          SafeArea(
            top: false,
            child: ElevatedButton(
              onPressed: onSave,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                backgroundColor: const Color(0xFF568C72),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white, 
                      ),
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send_rounded, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Salvar anotação",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
