class Route {
  final int id;
  final String route;
  final String company;
  final String status;

  Route({
    required this.id,
    required this.route,
    required this.company,
    required this.status,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      id: json['id'],
      route: json['route'],
      company: json['company'],
      status: json['status'],
    );
  }
}