import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:projetofarma/utils.dart';

class ConfirmPresenceScreen extends StatefulWidget {
  const ConfirmPresenceScreen({super.key});

  @override
  _ConfirmPresenceScreenState createState() => _ConfirmPresenceScreenState();
}

class _ConfirmPresenceScreenState extends State<ConfirmPresenceScreen> {
  File? _image;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _confirmCode(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/initialscreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmar presença',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Utils.eurofarmaBlue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _openCamera,
                child: const Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Utils.eurofarmaBlue,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Escanear QrCode',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              const Text(
                'ou',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              const Text(
                'Digitar código da aula',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Código da aula',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo necessário';
                    }
                    if (value.length != 5) {
                      return '5 caracteres necessários';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    _confirmCode(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Utils.eurofarmaBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    elevation: 5,
                  ),
                  child: const Text('Confirmar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
