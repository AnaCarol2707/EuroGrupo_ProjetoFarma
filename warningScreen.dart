import 'package:flutter/material.dart';
import 'package:projetofarma/utils.dart';

class warningScreen extends StatelessWidget {
  final List<String> notices = [
    'Lembrete: o treinamento sobre novas ferramentas ocorrerá na próxima terça-feira, às 10h.',
    'Atenção: as inscrições para o workshop de liderança estão abertas até sexta-feira!',
    'Não perca: o treinamento de integração para novos funcionários será na quinta-feira, às 9h.',
    'Importante: o curso de segurança no trabalho será realizado na próxima segunda, às 15h. Reserve seu lugar!',
    'Lembre-se: o treinamento de reciclagem acontece no dia 30. Confira sua agenda!',
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
