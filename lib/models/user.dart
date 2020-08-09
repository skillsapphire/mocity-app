import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User{

  String username;
  String email;
  String password;
  String token;

  User({this.username, this.email, this.token, this.password});
  factory User.fromJson(dynamic user) => _$UserFromJson(user);

}

User _$UserFromJson(dynamic json) {

  String username = json["user_display_name"];
  String email = json["user_email"];
  String token = json["token"];
  
  return User(
    username: username,
    email: email,
    token: token,
    password: null
  );
}