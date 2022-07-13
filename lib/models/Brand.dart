/// id : 2
/// ts_created : "2022-07-13T14:26:55.844168Z"
/// ts_updated : "2022-07-13T14:26:55.844767Z"
/// image : "/media/None/bmw_prev_ui.png"
/// title : "BMW"
/// description : "bmw car icon"

class Brand {
  Brand({
      int id, 
      String tsCreated, 
      String tsUpdated, 
      String image, 
      String title, 
      String description,}){
    _id = id;
    _tsCreated = tsCreated;
    _tsUpdated = tsUpdated;
    _image = image;
    _title = title;
    _description = description;
}

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _tsCreated = json['ts_created'];
    _tsUpdated = json['ts_updated'];
    _image = json['image'];
    _title = json['title'];
    _description = json['description'];
  }
  int _id;
  String _tsCreated;
  String _tsUpdated;
  String _image;
  String _title;
  String _description;

  int get id => _id;
  String get tsCreated => _tsCreated;
  String get tsUpdated => _tsUpdated;
  String get image => _image;
  String get title => _title;
  String get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ts_created'] = _tsCreated;
    map['ts_updated'] = _tsUpdated;
    map['image'] = _image;
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }

  static List<Brand> fromJsonList(jsonList) {
    return jsonList.map<Brand>((obj) => Brand.fromJson(obj)).toList();
  }
}