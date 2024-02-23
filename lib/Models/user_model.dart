part 'address.dart';
part 'geo.dart';
part 'company.dart';

class UserModel {
  UserModel({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _address = address;
    _phone = phone;
    _website = website;
    _company = company;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _phone = json['phone'];
    _website = json['website'];
    _company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  int? _id;
  String? _name;
  String? _username;
  String? _email;
  Address? _address;
  String? _phone;
  String? _website;
  Company? _company;

  int? get id => _id;
  String? get name => _name;
  String? get username => _username;
  String? get email => _email;
  Address? get address => _address;
  String? get phone => _phone;
  String? get website => _website;
  Company? get company => _company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    map['phone'] = _phone;
    map['website'] = _website;
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    return map;
  }
}
