import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:projetofarma/utils.dart';
import 'package:intl/intl.dart'; // Importar pacote para formatação

class SchedulingScreen extends StatefulWidget {
  @override
  _SchedulingScreenState createState() => _SchedulingScreenState();
}

class _SchedulingScreenState extends State<SchedulingScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now(); // Variável para o horário
  final TextEditingController temaController = TextEditingController();
  final TextEditingController conteudoController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar nova palestra'),
        centerTitle: true,
        backgroundColor: Utils.eurofarmaBlue,
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Selecione uma data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TableCalendar(
              focusedDay: selectedDate,
              firstDay: DateTime.now(),
              lastDay: DateTime(2100),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  selectedDate = selectedDay;
                });
                _showInputDialog();
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showInputDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Agendar Palestra'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: temaController,
                  decoration: const InputDecoration(labelText: 'Tema'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: conteudoController,
                  decoration: const InputDecoration(labelText: 'Conteúdo'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                      });
                    }
                  },
                  child: const Text('Selecionar Horário'),
                ),
                Text('Horário selecionado: ${selectedTime.format(context)}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final tema = temaController.text;
                final conteudo = conteudoController.text;
                final descricao = descricaoController.text;

                if (tema.isNotEmpty &&
                    conteudo.isNotEmpty &&
                    descricao.isNotEmpty) {
                  // Formatar data e hora
                  final formattedDate =
                      DateFormat('dd/MM/yyyy').format(selectedDate);
                  final formattedTime = selectedTime.format(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Palestra agendada para $formattedDate às $formattedTime')),
                  );
                  Navigator.of(context).pop();
                  temaController.clear();
                  conteudoController.clear();
                  descricaoController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Preencha todos os campos')),
                  );
                }
              },
              child: const Text('Agendar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
