/// id : 1
/// ts_created : "2022-06-28T10:40:48.969099Z"
/// ts_updated : "2022-06-28T10:40:49.518496Z"
/// name : "Admin"
/// password : null
/// email : "a"
/// address : "a"
/// phone : "a"
/// lat : 2.0
/// lng : 2.0
/// profile_image : "1"
/// status : 1
/// is_active : true
/// note : "3"

class Users {
  Users({
      int id, 
      String tsCreated, 
      String tsUpdated, 
      String name, 
      dynamic password, 
      String email, 
      String address, 
      String phone, 
      double lat, 
      double lng, 
      String profileImage, 
      int status, 
      bool isActive, 
      String note,}){
    _id = id;
    _tsCreated = tsCreated;
    _tsUpdated = tsUpdated;
    _name = name;
    _password = password;
    _email = email;
    _address = address;
    _phone = phone;
    _lat = lat;
    _lng = lng;
    _profileImage = profileImage;
    _status = status;
    _isActive = isActive;
    _note = note;
}

  Users.fromJson(dynamic json) {
    _id = json['id'];
    _tsCreated = json['ts_created'];
    _tsUpdated = json['ts_updated'];
    _name = json['name'];
    _password = json['password'];
    _email = json['email'];
    _address = json['address'];
    _phone = json['phone'];
    _lat = json['lat'];
    _lng = json['lng'];
    _profileImage = json['profile_image'];
    _status = json['status'];
    _isActive = json['is_active'];
    _note = json['note'];
  }
  int _id;
  String _tsCreated;
  String _tsUpdated;
  String _name;
  dynamic _password;
  String _email;
  String _address;
  String _phone;
  double _lat;
  double _lng;
  String _profileImage;
  int _status;
  bool _isActive;
  String _note;

  int get id => _id;
  String get tsCreated => _tsCreated;
  String get tsUpdated => _tsUpdated;
  String get name => _name;
  dynamic get password => _password;
  String get email => _email;
  String get address => _address;
  String get phone => _phone;
  double get lat => _lat;
  double get lng => _lng;
  String get profileImage => _profileImage;
  int get status => _status;
  bool get isActive => _isActive;
  String get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ts_created'] = _tsCreated;
    map['ts_updated'] = _tsUpdated;
    map['name'] = _name;
    map['password'] = _password;
    map['email'] = _email;
    map['address'] = _address;
    map['phone'] = _phone;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['profile_image'] = _profileImage;
    map['status'] = _status;
    map['is_active'] = _isActive;
    map['note'] = _note;
    return map;
  }

  static List<Users> fromJsonList(jsonList) {
    return jsonList.map<Users>((obj) => Users.fromJson(obj)).toList();
  }
}