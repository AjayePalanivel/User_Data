// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserDataModel {
  int id;
  String name;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  UserDataModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  UserDataModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] as int,
        name = map['name'] as String,
        email = map['email'] as String,
        address = Address.fromMap(map['address'] as Map<String, dynamic>),
        phone = map['phone'] as String,
        website = map['website'] as String,
        company = Company.fromMap(map['company'] as Map<String, dynamic>);

  factory UserDataModel.fromJson(String str) =>
      UserDataModel.fromMap(jsonDecode(str) as Map<String, dynamic>);
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address.fromMap(Map<String, dynamic> map)
      : street = map['street'] as String,
        suite = map['suite'] as String,
        city = map['city'] as String,
        zipcode = map['zipcode'] as String,
        geo = Geo.fromMap(map['geo'] as Map<String, dynamic>);
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company.fromMap(Map<String, dynamic> map)
      : name = map['name'] as String,
        catchPhrase = map['catchPhrase'] as String,
        bs = map['bs'] as String;
}

class Geo {
  String lat;
  String lng;

  Geo.fromMap(Map<String, dynamic> map)
      : lat = map['lat'] as String,
        lng = map['lng'] as String;
}
