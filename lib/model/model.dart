import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  int id;
  String name;
  String company;
  String username;
  String email;
  String address;
  String zip;
  String state;
  String country;
  String phone;
  String photo;

  User({
    required this.id,
    required this.name,
    required this.company,
    required this.username,
    required this.email,
    required this.address,
    required this.zip,
    required this.state,
    required this.country,
    required this.phone,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    company: json["company"],
    username: json["username"],
    email: json["email"],
    address: json["address"],
    zip: json["zip"],
    state: json["state"],
    country: json["country"],
    phone: json["phone"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "company": company,
    "username": username,
    "email": email,
    "address": address,
    "zip": zip,
    "state": state,
    "country": country,
    "phone": phone,
    "photo": photo,
  };
}
