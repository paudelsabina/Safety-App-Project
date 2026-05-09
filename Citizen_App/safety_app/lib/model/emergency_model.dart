class Emergency {
  final String? id;
  final String type;
  final double lat;
  final double long;

  Emergency({
    this.id,
    required this.type,
    required this.lat,
    required this.long,
  });
  Map<String, dynamic> toJson() {
    return {'id': id, 'type': type, 'lat': lat, 'long': long};
  }
}
