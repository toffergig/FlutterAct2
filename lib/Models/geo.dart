part of 'user_model.dart';

class Geo {
  Geo({
    String? lat,
    String? lng,
  }) {
    _lat = lat;
    _lng = lng;
  }

  Geo.fromJson(dynamic json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  String? _lat;
  String? _lng;

  String? get lat => _lat;
  String? get lng => _lng;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lng'] = _lng;
    return map;
  }
}
