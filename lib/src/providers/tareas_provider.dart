class TareasProvider {
  List<Map<String, dynamic>> _tareas = [];

  static final TareasProvider _instancia = TareasProvider._privado();
  TareasProvider._privado() {
    _tareas = [
      {
        'nombre': 'Tarea 1',
        'descripcion': 'Descripcion de la tarea 1',
        'estado': false,
      },
    ];
  }

  factory TareasProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get tareas {
    return _tareas;
  }

  void agregarTarea(Map<String, dynamic> nuevaTarea) {
    _tareas.add(nuevaTarea);
  }
}
