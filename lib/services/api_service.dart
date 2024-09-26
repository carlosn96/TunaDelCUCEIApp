import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/integrante.dart';
import '../models/evento.dart';

class ApiService {
  static const String baseUrl = 'http://localhost/TunaCUCEI';

  // Función para autenticar un usuario
  Future<Map<String, dynamic>> authenticateUser(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/integrante/autenticar'),
      body: jsonEncode(<String, String>{
        'correo': email,
        'contrasenia': password,
      }),
    );
    return {"codigo": response.statusCode, "body": json.decode(response.body)};
  }

  // Obtener todos los integrantes
  Future<List<Integrante>> fetchIntegrantes() async {
    final response = await http.get(Uri.parse('$baseUrl/integrante'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Integrante.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los integrantes');
    }
  }

  // Obtener un integrante por ID
  Future<Integrante?> fetchIntegranteById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/integrante/$id'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Integrante.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } else {
      throw Exception('Error al cargar el integrante');
    }
  }

  // Obtener todos los eventos
  Future<List<Evento>> fetchEventos() async {
    final response = await http.get(Uri.parse('$baseUrl/evento'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Evento.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar los eventos');
    }
  }

  // Obtener un evento por ID
  Future<Evento?> fetchEventoById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/evento/$id'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return Evento.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } else {
      throw Exception('Error al cargar el evento');
    }
  }
}
