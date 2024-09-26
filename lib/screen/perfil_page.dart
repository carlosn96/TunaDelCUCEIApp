import 'package:flutter/material.dart';
import 'dart:convert';  // Para manejar la respuesta de la API
import 'package:http/http.dart' as http;  // Añadido paquete http para consumir la API

class PerfilPage extends StatelessWidget {
  final String userId;

  const PerfilPage({super.key, required this.userId});

  // Método para obtener los datos del perfil
  Future<Map<String, dynamic>> _getPerfilData() async {
    final response = await http.get(Uri.parse('https://joannesystem.com/TunaCUCEI/integrante/$userId'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _getPerfilData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No se encontraron datos'));
          }

          final perfilData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: ${perfilData['nombre']}', style: const TextStyle(fontSize: 18)),
                Text('Mote: ${perfilData['mote']}', style: const TextStyle(fontSize: 18)),
                Text('Fecha de Ingreso: ${perfilData['fechaIngreso']}', style: const TextStyle(fontSize: 18)),
                Text('Rango: ${perfilData['rango']}', style: const TextStyle(fontSize: 18)),
                // Mostrar otros datos, como instrumentos, etc.
              ],
            ),
          );
        },
      ),
    );
  }
}
