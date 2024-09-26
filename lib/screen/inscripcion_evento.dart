import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InscripcionEventoPage extends StatelessWidget {
  final String eventId;

  const InscripcionEventoPage({super.key, required this.eventId});

  Future<void> _inscribirUsuario(String userId) async {
    final response = await http.post(
      Uri.parse('https://joannesystem.com/TunaCUCEI/evento/$eventId'),
      body: jsonEncode({'userId': userId}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Maneja la inscripción exitosa
      print('Inscripción exitosa');
    } else {
      // Maneja el error
      throw Exception('Error al inscribir al usuario');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscripción al Evento')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _inscribirUsuario('123'); // Supongamos que el userId es '123'
          },
          child: const Text('Inscribirse al Evento'),
        ),
      ),
    );
  }
}
