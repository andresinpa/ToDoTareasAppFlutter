import "package:flutter/material.dart";
import "package:planeador_app/src/pages/formulario.dart";
import "package:planeador_app/src/pages/listado.dart";
import "package:planeador_app/src/providers/tareas_provider.dart";

class DetallePage extends StatelessWidget {
  const DetallePage({super.key});
  static final nombrePagina = "detalle";

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? tarea =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                bottom: 40,
              ),
              child: Text(
                '${tarea!['nombre']}',
                style: const TextStyle(fontSize: 20.0),
              ),
            ),
            const Text(
              'Descripción',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 40,
                ),
                child: Text('${tarea['descripcion']}')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    TareasProvider().terminarTarea(tarea);
                    Navigator.popAndPushNamed(
                        context, ListadoPage.nombrePagina);
                  },
                  child: const Text('Terminar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () => Navigator.pushNamed(
                      context, FormularioPage.nombrePagina,
                      arguments: tarea),
                  child: const Text('Editar'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    TareasProvider().eliminarTarea(tarea);
                    Navigator.popAndPushNamed(
                        context, ListadoPage.nombrePagina);
                  },
                  child: const Text('Eliminar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
