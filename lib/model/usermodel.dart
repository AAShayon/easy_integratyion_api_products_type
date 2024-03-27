import 'dart:convert';
/// id : 15
/// username : "kminchelle"
/// email : "kminchelle@qq.com"
/// firstName : "Jeanne"
/// lastName : "Halvorson"
/// gender : "female"
/// image : "https://robohash.org/Jeanne.png?set=set4"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs"

User userModelFromJson(String str) => User.fromJson(json.decode(str));
String userModelToJson(User data) => json.encode(data.toJson());
class User {
  User({
    dynamic id,
    dynamic username,
    dynamic email,
    dynamic firstName,
    dynamic lastName,
    dynamic gender,
    dynamic image,
    dynamic token,}){
    _id = id;
    _username = username;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _image = image;
    _token = token;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _gender = json['gender'];
    _image = json['image'];
    _token = json['token'];
  }
  dynamic _id;
  dynamic _username;
  dynamic _email;
  dynamic _firstName;
  dynamic _lastName;
  dynamic _gender;
  dynamic _image;
  dynamic _token;
  User copyWith({  dynamic id,
    dynamic username,
    dynamic email,
    dynamic firstName,
    dynamic lastName,
    dynamic gender,
    dynamic image,
    dynamic token,
  }) => User(  id: id ?? _id,
    username: username ?? _username,
    email: email ?? _email,
    firstName: firstName ?? _firstName,
    lastName: lastName ?? _lastName,
    gender: gender ?? _gender,
    image: image ?? _image,
    token: token ?? _token,
  );
  dynamic get id => _id;
  dynamic get username => _username;
  dynamic get email => _email;
  dynamic get firstName => _firstName;
  dynamic get lastName => _lastName;
  dynamic get gender => _gender;
  dynamic get image => _image;
  dynamic get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['gender'] = _gender;
    map['image'] = _image;
    map['token'] = _token;
    return map;
  }

}