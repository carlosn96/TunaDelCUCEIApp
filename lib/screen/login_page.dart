import '../services/api_service.dart';
import '../services/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      String _username = _usernameController.text;
      String _password = _passwordController.text;

      try {
        var resp = await ApiService().authenticateUser(_username, _password);
        var codigo = resp["codigo"];
        var rol = resp["body"]["rol"];

        if (codigo == 200) {
          // Si el código es 200, verifica el rol
          if (rol == 'estandar') {
            // Navega a la pantalla de usuario estándar
            Navigator.pushReplacementNamed(context, '/usuarioEstandar');
          } else if (rol == 'administrador') {
            // Navega a la pantalla de administrador
            Navigator.pushReplacementNamed(context, '/usuarioAdministrador');
          } else {
            Utils.showMessage(context, 'Rol no reconocido: $rol');
          }
        } else {
          // Si el código no es 200, muestra el mensaje correspondiente
          Utils.showStatusCodeMessage(context, codigo);
        }
      } catch (e) {
        // Manejo de errores generales
        Utils.showMessage(context, e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 105, 84, 76), // Color de fondo
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Asociamos el formulario al _formKey
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    '../assets/images/EscudoTuna.png',
                    width: 150.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '¡Aúpa, CUCEI!',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 252, 248, 34),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Campo de texto para el nombre de usuario
                TextFormField(
                  controller: _usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Correo electrónico',
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 142, 118, 110),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  validator: (value) {
                    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                    return (value == null || value.isEmpty)
                        ? 'Por favor ingrese su correo'
                        : (!RegExp(pattern).hasMatch(value))
                            ? 'Por favor ingrese un correo válido'
                            : null;
                  },
                ),

                const SizedBox(height: 10.0),
                // Campo de texto para la contraseña
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 142, 118, 110),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                // Botón de inicio de sesión
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 15.0),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.brown,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    // Acción para recuperar contraseña
                  },
                  child: const Text(
                    "Recuperar contraseña",
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 248, 34),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Acción para crear una cuenta
                  },
                  child: const Text(
                    "Crear una cuenta",
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 248, 34),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
