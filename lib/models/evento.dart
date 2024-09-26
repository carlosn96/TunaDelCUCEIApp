class Evento {
  final int id;
  final String nombre;
  final DateTime fechaHora;
  final String lugar;
  final String descripcion;

  Evento({
    required this.id,
    required this.nombre,
    required this.fechaHora,
    required this.lugar,
    required this.descripcion,
  });

  factory Evento.fromJson(Map<String, dynamic> json) {
    return Evento(
      id: json['id'],
      nombre: json['nombre'],
      fechaHora: DateTime.parse(json['fechaHora']),
      lugar: json['lugar'],
      descripcion: json['descripcion'],
    );
  }
}
