part of 'user_model.dart';

class Address {
  Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    Geo? geo,
  }) {
    _street = street;
    _suite = suite;
    _city = city;
    _zipcode = zipcode;
    _geo = geo;
  }

  Address.fromJson(dynamic json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    _geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? _geo;

  String? get street => _street;
  String? get suite => _suite;
  String? get city => _city;
  String? get zipcode => _zipcode;
  Geo? get geo => _geo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = _street;
    map['suite'] = _suite;
    map['city'] = _city;
    map['zipcode'] = _zipcode;
    if (_geo != null) {
      map['geo'] = _geo?.toJson();
    }
    return map;
  }
}
