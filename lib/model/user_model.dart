class UserAuth {
  final String username;
  final String name;
  final String surname;
  final bool isAdmin;
  final String email;

  const UserAuth({
    required this.username,
    required this.name,
    required this.surname,
    required this.isAdmin,
    required this.email,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      username: json['username'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
    );
  }
}