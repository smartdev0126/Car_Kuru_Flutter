/// id : 1
/// ts_created : "2022-06-28T10:58:07.994635Z"
/// ts_updated : "2022-06-28T10:58:09.356582Z"
/// title : "3"
/// description : "33"
/// image : "/media/None/aci_YoFaIRD.png"
/// price : 22.0
/// edition : "2"
/// model : "2"
/// fuel_type : "2"
/// year : "2022-06-28T10:57:46Z"
/// transmission : "2"
/// category : 1
/// brand : 1

class AllVehicle {
  AllVehicle({
      int id,
      String tsCreated,
      String tsUpdated,
      String title,
      String description,
      String image,
      double price,
      String edition,
      String model,
      String fuelType,
      String year,
      String transmission,
      int category,
      int brand,}){
    _id = id;
    _tsCreated = tsCreated;
    _tsUpdated = tsUpdated;
    _title = title;
    _description = description;
    _image = image;
    _price = price;
    _edition = edition;
    _model = model;
    _fuelType = fuelType;
    _year = year;
    _transmission = transmission;
    _category = category;
    _brand = brand;
}

  AllVehicle.fromJson(dynamic json) {
    _id = json['id'];
    _tsCreated = json['ts_created'];
    _tsUpdated = json['ts_updated'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _price = json['price'];
    _edition = json['edition'];
    _model = json['model'];
    _fuelType = json['fuel_type'];
    _year = json['year'];
    _transmission = json['transmission'];
    _category = json['category'];
    _brand = json['brand'];
  }
  int _id;
  String _tsCreated;
  String _tsUpdated;
  String _title;
  String _description;
  String _image;
  double _price;
  String _edition;
  String _model;
  String _fuelType;
  String _year;
  String _transmission;
  int _category;
  int _brand;

  int get id => _id;
  String get tsCreated => _tsCreated;
  String get tsUpdated => _tsUpdated;
  String get title => _title;
  String get description => _description;
  String get image => _image;
  double get price => _price;
  String get edition => _edition;
  String get model => _model;
  String get fuelType => _fuelType;
  String get year => _year;
  String get transmission => _transmission;
  int get category => _category;
  int get brand => _brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ts_created'] = _tsCreated;
    map['ts_updated'] = _tsUpdated;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['price'] = _price;
    map['edition'] = _edition;
    map['model'] = _model;
    map['fuel_type'] = _fuelType;
    map['year'] = _year;
    map['transmission'] = _transmission;
    map['category'] = _category;
    map['brand'] = _brand;
    return map;
  }

  static List<AllVehicle> fromJsonList(jsonList) {
    return jsonList.map<AllVehicle>((obj) => AllVehicle.fromJson(obj)).toList();
  }

}