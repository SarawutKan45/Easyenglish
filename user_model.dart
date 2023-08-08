import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final int score;

  UserModel({
    this.email,
    this.name,
    this.score,
  });

  UserModel copyWith({
    String email,
    String name,
    int score,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      email: map['email'],
      name: map['name'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(email: $email, name: $name, score: $score)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserModel &&
        o.email == email &&
        o.name == name &&
        o.score == score;
  }

  @override
  int get hashCode => email.hashCode ^ name.hashCode ^ score.hashCode;
}
