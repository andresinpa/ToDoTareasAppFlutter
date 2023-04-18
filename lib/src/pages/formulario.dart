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

  Map<String, dynamic> nuevaTarea = {};
  @override
  Widget build(BuildContext context) {
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
          TareasProvider().agregarTarea(nuevaTarea);
          Navigator.popAndPushNamed(context, ListadoPage.nombrePagina);
        },
        child: const Text('Crear Tarea'),
      ),
    );
  }
}
