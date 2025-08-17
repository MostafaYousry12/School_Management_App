class UserModel {
  final String id;
  final String role;
  final String email;

  final String? photoUrl;

  UserModel(
      {required this.id,
      required this.role,
      required this.email,
      this.photoUrl});

  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'role': role,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['uid'] ?? "",
      role: map['role'] ?? "",
      email: map['email'] ?? "",
      photoUrl: map['photoUrl'] ?? "",
    );
  }
}
