import 'package:flutter/material.dart';

class Utils {
  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void showStatusCodeMessage(BuildContext context, int statusCode) {
    String message;
    switch (statusCode) {
      case 200:
        message = 'Operación correcta';
        break;
      case 400:
        message = 'La información ingresada es incorrecta';
        break;
      case 401:
        message = 'No autorizado. Verifique sus credenciales.';
        break;
      case 404:
        message = 'Recurso no encontrado';
        break;
      case 500:
        message = 'Error interno del servidor. Intente de nuevo más tarde.';
        break;
      default:
        message = 'Error desconocido. Código de estado: $statusCode';
        break;
    }
    showMessage(context, message);
  }
}
