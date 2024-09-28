import 'package:flutter/material.dart';
import 'package:projetofarma/utils.dart';
import 'package:projetofarma/list.dart';

class DetailsScreen extends StatelessWidget {
  final String tema;
  final String data;
  final String conteudo;
  final String qntPresentes;
  final List<Convidado> convidados;
  final String descricao;

  DetailsScreen({
    required this.tema,
    required this.data,
    required this.conteudo,
    required this.qntPresentes,
    required this.convidados,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tema),
        backgroundColor: Utils.eurofarmaBlue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoSection('Data', data),
              _buildInfoSection('Conteúdo', conteudo),
              _buildInfoSection('Presentes', qntPresentes),
              SizedBox(height: 16),
              _buildDescriptionSection(),
              SizedBox(height: 16),
              _buildGuestsTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title: $content',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Divider(),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Descrição:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 8),
        Text(descricao),
        Divider(),
      ],
    );
  }

  Widget _buildGuestsTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Convidados:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        DataTable(
          columns: [
            DataColumn(label: Text('Nome', style: TextStyle(fontWeight: FontWeight.bold))),
            DataColumn(label: Text('Presente', style: TextStyle(fontWeight: FontWeight.bold))),
          ],
          rows: convidados
              .map((convidado) => DataRow(
                    cells: [
                      DataCell(Text(convidado.nome)),
                      DataCell(
                        Icon(
                          convidado.presente ? Icons.check : Icons.close,
                          color: convidado.presente ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
