import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String name;
    String id;
    String email;
    String token;

    User({
        this.name,
        this.id,
        this.email,
        this.token,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        id: json["id"],
        email: json["email"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
        "token": token,
    };
}
