import 'package:flutter/material.dart';
import 'package:planeador_app/src/pages/listado.dart';
import 'package:planeador_app/src/providers/tareas_provider.dart';

class FormularioPage extends StatefulWidget {
  const FormularioPage({Key? key}) : super(key: key);

  static const nombrePagina = 'formulario';
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final idForm = GlobalKey<FormState>();
  Map<String, dynamic>? tarea;

  Map<String, dynamic> nuevaTarea = {};
  @override
  Widget build(BuildContext context) {
    tarea = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Form(
            key: idForm,
            child: Column(
              children: <Widget>[
                _crearInputNombre(),
                _crearInputDescripcion(),
                _crearBotonAgregar(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearInputNombre() {
    return TextFormField(
      initialValue: (tarea != null) ? tarea!['nombre'] : "",
      onSaved: (valor) {
        nuevaTarea['nombre'] = valor;
      },
      decoration: const InputDecoration(
        hintText: 'Nombre de la tarea',
      ),
    );
  }

  _crearInputDescripcion() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: TextFormField(
        initialValue: (tarea != null) ? tarea!['descripcion'] : "",
        onSaved: (valor) {
          nuevaTarea['descripcion'] = valor;
        },
        maxLines: null,
        decoration: const InputDecoration(
          hintText: 'Descripción de la tarea',
        ),
      ),
    );
  }

  _crearBotonAgregar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: ElevatedButton(
        onPressed: () {
          idForm.currentState?.save();
          nuevaTarea['estado'] = false;
          if (tarea != null) {
            TareasProvider().editarTarea(nuevaTarea, tarea!);
            Navigator.popAndPushNamed(context, ListadoPage.nombrePagina);
          } else {
            TareasProvider().agregarTarea(nuevaTarea);
            Navigator.popAndPushNamed(context, ListadoPage.nombrePagina);
          }
        },
        child: (tarea != null)
            ? const Text('Editar Tarea')
            : const Text('Crear Tarea'),
      ),
    );
  }
}
