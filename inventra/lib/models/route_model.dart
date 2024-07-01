class Routes {
  final int id;
  final String route;
  final String company;
  final String status;

  Routes({
    required this.id,
    required this.route,
    required this.company,
    required this.status,
  });

  factory Routes.fromJson(Map<String, dynamic> json) {
    return Routes(
      id: json['id'],
      route: json['route'],
      company: json['company'],
      status: json['status'],
    );
  }
}