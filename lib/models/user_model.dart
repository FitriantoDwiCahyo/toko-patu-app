class UserModel {
  String accessToken;
  String tokenType;
  User user;

  UserModel({
    required this.accessToken,
    required this.tokenType,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access_token'],
      tokenType: json['token_type'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  int id;
  String name;
  String email;
  String username;
  String roles;
  DateTime? emailVerifiedAt;
  int? currentTeamId;
  String? profilePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  String profilePhotoUrl;
  String token; // Tidak menggunakan null safety untuk token

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.username,
    required this.roles,
    required this.emailVerifiedAt,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePhotoUrl,
    required this.token, // Properti token tanpa tanda tanya
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      roles: json['roles'] ?? '',
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      currentTeamId: json['current_team_id'] != null ?int.parse(json['current_team_id']) : 0,
      profilePhotoPath: json['profile_photo_path'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      profilePhotoUrl: json['profile_photo_url'] ?? '',
      token:
          json['token'] ?? '', // Menggunakan nilai default jika token tidak ada
    );
  }
}
