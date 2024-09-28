import 'package:flutter/material.dart';
import 'package:projetofarma/ListScreen.dart';
import 'dart:ui';
import 'package:projetofarma/warningScreen.dart';
import 'package:projetofarma/utils.dart';
import 'package:projetofarma/schedulingScreen.dart';

class InitialScreen extends StatelessWidget {
  @override
  String name = 'Profª Mariana Costa';

  InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Utils.eurofarmaBlue,
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Utils.eurofarmaBlue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.article),
              title: const Text('Relatórios de Palestras'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule),
              title: const Text('Agendar nova palestra'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SchedulingScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.announcement),
              title: const Text('Avisos'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => warningScreen()));
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                  child: Container(
                    color: Colors.black.withOpacity(0.11),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: Utils.eurofarmaBlue.withOpacity(0.7),
              ),
              Positioned.fill(
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 32, color: Colors.white),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Seja bem-vindo (a) ao \n ProjetoFarma, \n \n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: name,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                        const TextSpan(
                          text: '!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListScreen()));
                      },
                      icon: const Icon(Icons.article, size: 24),
                      label: const Text('Relatórios de Palestras'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Utils.eurofarmaBlue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SchedulingScreen()));
                      },
                      icon: const Icon(Icons.schedule, size: 24),
                      label: const Text('Agendar nova palestra'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Utils.eurofarmaBlue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => warningScreen()));
                      },
                      icon: const Icon(Icons.announcement, size: 24),
                      label: const Text('Avisos'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Utils.eurofarmaBlue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
