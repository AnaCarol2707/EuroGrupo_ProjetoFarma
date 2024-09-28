import 'package:flutter/material.dart';
import 'package:projetofarma/utils.dart';

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> dados = [
    {
      'nome': 'Gabriel De Oliveira Castilho',
      'data': '23-06-2024',
      'conteúdo': 'Aula',
      'presença': 'Presente',
    },
    {
      'nome': 'Gabriel De Oliveira Castilho',
      'data': '25-09-2024',
      'conteúdo': 'Palestra',
      'presença': 'Ausente',
    },
    {
      'nome': 'Gabriel De Oliveira Castilho',
      'data': '24-09-2024',
      'conteúdo': 'Aula',
      'presença': 'Presente',
    },
    {
      'nome': 'Gabriel De Oliveira Castilho',
      'data': '20-10-2024',
      'conteúdo': 'Aula',
      'presença': 'Ausente',
    },
    {
      'nome': 'Gabriel De Oliveira Castilho',
      'data': '10-08-2024',
      'conteúdo': 'Palestra',
      'presença': 'Presente',
    },
  ];

  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Presença',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Utils.eurofarmaBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: dados.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(dados[index]['nome']!),
              subtitle: Text(
                'Data: ${dados[index]['data']} | Conteúdo: ${dados[index]['conteúdo']} | Presença: ${dados[index]['presença']}',
              ),
            ),
          );
        },
      ),
    );
  }
}
