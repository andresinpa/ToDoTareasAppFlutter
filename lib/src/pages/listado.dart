import 'package:flutter/material.dart';
import 'package:planeador_app/src/pages/detalle.dart';
import 'package:planeador_app/src/pages/formulario.dart';

import '../providers/tareas_provider.dart';

class ListadoPage extends StatefulWidget {
  const ListadoPage({super.key});

  static const nombrePagina = "listado";
  static final List<Map<String, dynamic>> tareas = [];

  @override
  State<ListadoPage> createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
      ),
      body: (TareasProvider().tareas.isNotEmpty)
          ? ListView(
              children: _crearItem(context),
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

  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];
    for (Map<String, dynamic> tarea in TareasProvider().tareas) {
      Widget item = ListTile(
        onTap: () => Navigator.pushNamed(context, DetallePage.nombrePagina,
            arguments: tarea),
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
