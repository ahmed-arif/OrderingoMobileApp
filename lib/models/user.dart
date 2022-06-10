import 'dart:io';

class User {
  String? id;
  String? username;
  String? fname;
  String? lname;
  String? email;
  String? password;
  String? shopAddress;
  String? contactNumber;
  String? imageUrl;
  String? authToken;
  String? pastExperience;
  int? status;
  File? imageFile;

  User();

  User.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : '';
      username = jsonMap['username'] ?? '';
      fname = jsonMap['FirstName'] ?? '';
      lname = jsonMap['LastName'] ?? '';
      email = jsonMap['email'] ?? '';
    } catch (e) {
      print("User Model Error: $e");
    }
  }
}
