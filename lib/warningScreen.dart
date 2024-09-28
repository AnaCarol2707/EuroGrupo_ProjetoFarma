import 'package:flutter/material.dart';
import 'package:projetofarma/utils.dart';

class warningScreen extends StatelessWidget {
  final List<String> notices = [
    'Atenção: Verifique se todos os equipamentos necessários para sua palestra estão disponíveis.',
    'Importante: O prazo para enviar seus materiais de apresentação é até sexta-feira!',
    'Lembre-se: A sala da sua palestra foi alterada para o Auditório Principal.',
  ];

 warningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Avisos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Utils.eurofarmaBlue,
        elevation: 5,
        iconTheme:
            const IconThemeData(color: Colors.white), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: notices.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.announcement, color: Utils.eurofarmaBlue),
                title: Text(
                  notices[index],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
