class User {
  final int id;
  final String userName;
  final String name;
  final String role;
  final String status;
  final int salesRepId;
  final String mobileNumber;
  final bool hasMobile;
  final bool hasDesktop;

  User({
    required this.id,
    required this.userName,
    required this.name,
    required this.role,
    required this.status,
    required this.salesRepId,
    required this.mobileNumber,
    required this.hasMobile,
    required this.hasDesktop,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      name: json['name'],
      role: json['role'],
      status: json['status'],
      salesRepId: json['salesRepId'],
      mobileNumber: json['mobileNumber'],
      hasMobile: json['hasMobile'],
      hasDesktop: json['hasDesktop'],
    );
  }
}


