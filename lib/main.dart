import 'package:flutter/material.dart';
import 'mispantallas/inicio.dart';
import 'mispantallas/pantalla2.dart';
import 'mispantallas/pantalla3.dart';

void main() {
  runApp(const AlaBurgerApp());
}

class AlaBurgerApp extends StatelessWidget {
  const AlaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlaBurger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFB71C1C)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/menu': (context) => const Pantalla2(),
        '/contacto': (context) => const Pantalla3(),
      },
    );
  }
}