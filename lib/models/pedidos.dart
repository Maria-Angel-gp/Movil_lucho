class Pedido {
  final int id_pedido;
  final String observaciones;
  final double total_pedido;
  final int id_cliente;
  final DateTime fecha_pedido;

  Pedido({
    required this.id_pedido,
    required this.observaciones,
    required this.total_pedido,
    required this.id_cliente,
    required this.fecha_pedido,
  });

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      id_pedido: json['id_pedido'],
      observaciones: json['observaciones'],
      total_pedido: json['total_pedido'],
      id_cliente: json['id_cliente'],
      fecha_pedido: DateTime.parse(json['fecha_pedido']),
    );
  }

  static List<Pedido> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Pedido.fromJson(json)).toList();
  }
}
