class Actividad {
  int? id;
  String nombre;
  String descripcion;

  Actividad({this.id, required this.nombre, required this.descripcion});

  // Permite Convertir objeto a Map para SQLite
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nombre': nombre,
      'descripcion': descripcion,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  // Crea objeto desde un Map
  factory Actividad.fromMap(Map<String, dynamic> map) {
    return Actividad(
      id: map['id'],
      nombre: map['nombre'],
      descripcion: map['descripcion'],
    );
  }
}
