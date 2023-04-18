import 'package:flutter/material.dart';
import 'package:planeador_app/src/pages/formulario.dart';

import '../providers/tareas_provider.dart';

class ListadoPage extends StatelessWidget {
  const ListadoPage({super.key});

  static const nombrePagina = "listado";
  static final List<Map<String, dynamic>> tareas = [
    {
      'nombre': 'Tarea 1',
      'descripcion': 'Descripcion de la tarea 1',
      'estado': false,
    },
    {
      'nombre': 'Tarea 2',
      'descripcion': 'Descripcion de la tarea 2',
      'estado': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
      ),
      body: (TareasProvider().tareas.isNotEmpty)
          ? ListView(
              children: _crearItem(),
            )
          : const Center(
              child: Text('No hay tareas agregadas'),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.popAndPushNamed(context, FormularioPage.nombrePagina),
        child: const Icon(Icons.add),
      ),
    );
  }

  List<Widget> _crearItem() {
    List<Widget> temporal = [];
    for (Map<String, dynamic> tarea in TareasProvider().tareas) {
      Widget item = ListTile(
        title: Text('${tarea['nombre']}'),
        trailing: (tarea['estado'])
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      );
      temporal.add(item);
    }
    return temporal;
  }
}
