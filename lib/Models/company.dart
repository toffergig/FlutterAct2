part of 'user_model.dart';

class Company {
  Company({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    _name = name;
    _catchPhrase = catchPhrase;
    _bs = bs;
  }

  Company.fromJson(dynamic json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  String? _name;
  String? _catchPhrase;
  String? _bs;

  String? get name => _name;
  String? get catchPhrase => _catchPhrase;
  String? get bs => _bs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['catchPhrase'] = _catchPhrase;
    map['bs'] = _bs;
    return map;
  }
}
