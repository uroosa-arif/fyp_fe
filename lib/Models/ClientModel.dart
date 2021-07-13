class ClientModel {
  String id;
  String email;
  String password;
  String role;
  String fullName;
  String address;
  String phoneNumber;
  String gender;
  String profilePhotoUrl;
  String cnicFront;
  String cnicBack;
  List<dynamic> services;
  bool isAccepted;

  ClientModel({
    this.id,
    this.email,
    this.password,
    this.role,
    this.fullName,
    this.address,
    this.phoneNumber,
    this.gender,
    this.profilePhotoUrl,
    this.cnicFront,
    this.cnicBack,
    this.services,
    this.isAccepted,
  });

  ClientModel.fromJson(Map<String, dynamic> map) {
    this.id = map['id'];
    this.email = map['email'];
    this.password = map['password'];
    this.role = map['role'];
    this.fullName = map['fullName'];
    this.address = map['address'];
    this.phoneNumber = map['phoneNumber'];
    this.gender = map['gender'];
    this.profilePhotoUrl = map['profilePhotoUrl'];
    this.cnicFront = map['cnicFront'];
    this.cnicBack = map['cnicBack'];
    this.services = map['services'];
    this.isAccepted = map['isAccepted'];
  }

  Map<String, dynamic> toJson() {
    return {
      "isAccepted": this.isAccepted,
      "id": this.id,
      "email": this.email,
      "password": this.password,
      "role": this.role,
      "fullName": this.fullName,
      "address": this.address,
      "phoneNumber": this.phoneNumber,
      "gender": this.gender,
      "profilePhotoUrl": this.profilePhotoUrl,
      "cnicFront": this.cnicFront,
      "cnicBack": this.cnicBack,
      "services": this.services,
    };
  }
}

class RecentClientModel {
  String name;
  String profilImage;
  List services;

  RecentClientModel({this.name, this.profilImage, this.services});

  RecentClientModel.fromJson(Map<String, dynamic> map) {
    this.name = map['EmployeeName'];
    this.profilImage = map['EmployeePhoto'];
    this.services = map['EmployeeServices'];
  }
}
