class Integrante {
  final int id;
  final String nombre;
  final String mote;
  final String fechaIngreso;
  final String rango;
  final List<String> instrumentos;

  Integrante({
    required this.id,
    required this.nombre,
    required this.mote,
    required this.fechaIngreso,
    required this.rango,
    required this.instrumentos,
  });

  factory Integrante.fromJson(Map<String, dynamic> json) {
    return Integrante(
      id: json['id'],
      nombre: json['nombre'],
      mote: json['mote'],
      fechaIngreso: json['fechaIngreso'],
      rango: json['rango'],
      instrumentos: List<String>.from(json['instrumentos']),
    );
  }
}
