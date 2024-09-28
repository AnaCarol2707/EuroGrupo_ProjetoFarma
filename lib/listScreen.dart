import 'package:flutter/material.dart';
import 'package:projetofarma/utils.dart';
import 'package:projetofarma/list.dart';
import 'package:projetofarma/listDetailsScreen.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Relatórios de Palestras',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Utils.eurofarmaBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: dados.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(dados[index]['tema']!),
              subtitle: Text(
                'Data: ${dados[index]['data']} | Conteúdo: ${dados[index]['conteúdo']} | Presentes: ${dados[index]['qntPresentes']}',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      tema: dados[index]['tema']!,
                      data: dados[index]['data']!,
                      conteudo: dados[index]['conteúdo']!,
                      qntPresentes: dados[index]['qntPresentes']!,
                      convidados: parseConvidados(dados[index]['convidados']),
                      descricao: dados[index]['descricao']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
