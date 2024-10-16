import 'package:flutter/material.dart';
import 'pages/web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  void _validacion() {
    const String correo = 'prueba@gmail.com';
    const String contrasena = 'prueba';

    if (_correoController.text == correo &&
        _contrasenaController.text == contrasena) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WebPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Datos incorrectos'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 8, 24, 68),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'INGRESE SUS CREDENCIALES',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 200,
                    height: 200,
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _correoController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Correo electrónico',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _contrasenaController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Contraseña',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _validacion,
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
