import 'package:flutter/material.dart';
import 'package:planeador_app/src/pages/detalle.dart';
import 'package:planeador_app/src/pages/formulario.dart';
import 'package:planeador_app/src/pages/listado.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tareas y Metas',
        routes: {
          ListadoPage.nombrePagina: (BuildContext context) =>
              const ListadoPage(),
          FormularioPage.nombrePagina: (BuildContext context) =>
              const FormularioPage(),
          DetallePage.nombrePagina: (BuildContext context) =>
              const DetallePage(),
        },
        home: const ListadoPage());
  }
}
