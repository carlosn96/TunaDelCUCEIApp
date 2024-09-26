import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administración')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Lógica para gestionar integrantes
              },
              child: const Text('Gestionar Integrantes'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para gestionar eventos
              },
              child: const Text('Gestionar Eventos'),
            ),
          ],
        ),
      ),
    );
  }
}
