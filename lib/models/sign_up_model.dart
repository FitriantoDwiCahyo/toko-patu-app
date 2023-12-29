class SignUpModel {
  late final String name;
  late final String email;
  late final String username;
  late final String password;

  // Constructor dengan parameter wajib
  SignUpModel({
    required this.name,
    required this.email,
    required this.username,
    required this.password,
  });

  // Constructor untuk mengonversi dari JSON
  SignUpModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        username = json['username'],
        password = json['password'];

  // Metode untuk mengonversi ke JSON
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
