/// vehicle : {"id":1,"ts_created":"2022-06-28T10:58:07.994635Z","ts_updated":"2022-07-13T16:34:20.749903Z","title":"Nissan GT 10T","description":"This is the main description of the item. This is the main description This is the main description of the item. This is the main description of the item.","group":3,"image":"/media/None/WhatsApp_Image_2022-06-07_at_4.17.49_PM_1.jpeg","price":22.0,"edition":"2010","model":"2.2","fuel_type":"2","year":"2022-06-28T10:57:46Z","transmission":"2","category":1,"brand":1,"avg_bid":0}
/// bids : [{"id":1,"ts_created":"2022-07-12T09:40:38.040551Z","ts_updated":"2022-07-12T09:40:38.047151Z","text":"Bid 01","description":"This a bid descriptions","price":100.0,"is_winner":false,"user":3,"vehicle":1},{"id":2,"ts_created":"2022-07-12T18:55:28.960855Z","ts_updated":"2022-07-12T18:55:28.970664Z","text":"Bid 012","description":"3","price":10.0,"is_winner":false,"user":5,"vehicle":1},{"id":4,"ts_created":"2022-07-12T19:01:17.810161Z","ts_updated":"2022-07-12T19:01:17.816048Z","text":"3","description":"3","price":0.0,"is_winner":false,"user":2,"vehicle":1},{"id":3,"ts_created":"2022-07-12T18:58:12.137192Z","ts_updated":"2022-07-12T19:07:53.294558Z","text":"a","description":"a","price":10.01,"is_winner":false,"user":1,"vehicle":1},{"id":5,"ts_created":"2022-07-12T19:21:55.333570Z","ts_updated":"2022-07-12T19:21:55.339216Z","text":"3","description":"3","price":0.0,"is_winner":false,"user":1,"vehicle":1}]

class Vehicle {
  Vehicle({
      Vehicles vehicle,
      List<Bids> bids,}){
    _vehicle = vehicle;
    _bids = bids;
}

  Vehicle.fromJson(dynamic json) {
    _vehicle = json['vehicle'] != null ? Vehicles.fromJson(json['vehicle']) : null;
    if (json['bids'] != null) {
      _bids = [];
      json['bids'].forEach((v) {
        _bids.add(Bids.fromJson(v));
      });
    }
  }
  Vehicles _vehicle;
  List<Bids> _bids;

  Vehicles get vehicle => _vehicle;
  List<Bids> get bids => _bids;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_vehicle != null) {
      map['vehicle'] = _vehicle.toJson();
    }
    if (_bids != null) {
      map['bids'] = _bids.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// ts_created : "2022-07-12T09:40:38.040551Z"
/// ts_updated : "2022-07-12T09:40:38.047151Z"
/// text : "Bid 01"
/// description : "This a bid descriptions"
/// price : 100.0
/// is_winner : false
/// user : 3
/// vehicle : 1

class Bids {
  Bids({
      int id,
      String tsCreated,
      String tsUpdated,
      String text,
      String description,
      double price,
      bool isWinner,
      int user,
      int vehicle,}){
    _id = id;
    _tsCreated = tsCreated;
    _tsUpdated = tsUpdated;
    _text = text;
    _description = description;
    _price = price;
    _isWinner = isWinner;
    _user = user;
    _vehicle = vehicle;
}

  Bids.fromJson(dynamic json) {
    _id = json['id'];
    _tsCreated = json['ts_created'];
    _tsUpdated = json['ts_updated'];
    _text = json['text'];
    _description = json['description'];
    _price = json['price'];
    _isWinner = json['is_winner'];
    _user = json['user'];
    _vehicle = json['vehicle'];
  }
  int _id;
  String _tsCreated;
  String _tsUpdated;
  String _text;
  String _description;
  double _price;
  bool _isWinner;
  int _user;
  int _vehicle;

  int get id => _id;
  String get tsCreated => _tsCreated;
  String get tsUpdated => _tsUpdated;
  String get text => _text;
  String get description => _description;
  double get price => _price;
  bool get isWinner => _isWinner;
  int get user => _user;
  int get vehicle => _vehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ts_created'] = _tsCreated;
    map['ts_updated'] = _tsUpdated;
    map['text'] = _text;
    map['description'] = _description;
    map['price'] = _price;
    map['is_winner'] = _isWinner;
    map['user'] = _user;
    map['vehicle'] = _vehicle;
    return map;
  }

}

/// id : 1
/// ts_created : "2022-06-28T10:58:07.994635Z"
/// ts_updated : "2022-07-13T16:34:20.749903Z"
/// title : "Nissan GT 10T"
/// description : "This is the main description of the item. This is the main description This is the main description of the item. This is the main description of the item."
/// group : 3
/// image : "/media/None/WhatsApp_Image_2022-06-07_at_4.17.49_PM_1.jpeg"
/// price : 22.0
/// edition : "2010"
/// model : "2.2"
/// fuel_type : "2"
/// year : "2022-06-28T10:57:46Z"
/// transmission : "2"
/// category : 1
/// brand : 1
/// avg_bid : 0

class Vehicles {
  Vehicles({
      int id,
      String tsCreated,
      String tsUpdated,
      String title,
      String description,
      int group,
      String image,
      double price,
      String edition,
      String model,
      String fuelType,
      String year,
      String transmission,
      int category,
      int brand,
      int avgBid,}){
    _id = id;
    _tsCreated = tsCreated;
    _tsUpdated = tsUpdated;
    _title = title;
    _description = description;
    _group = group;
    _image = image;
    _price = price;
    _edition = edition;
    _model = model;
    _fuelType = fuelType;
    _year = year;
    _transmission = transmission;
    _category = category;
    _brand = brand;
    _avgBid = avgBid;
}

  Vehicles.fromJson(dynamic json) {
    _id = json['id'];
    _tsCreated = json['ts_created'];
    _tsUpdated = json['ts_updated'];
    _title = json['title'];
    _description = json['description'];
    _group = json['group'];
    _image = json['image'];
    _price = json['price'];
    _edition = json['edition'];
    _model = json['model'];
    _fuelType = json['fuel_type'];
    _year = json['year'];
    _transmission = json['transmission'];
    _category = json['category'];
    _brand = json['brand'];
    _avgBid = json['avg_bid'];
  }
  int _id;
  String _tsCreated;
  String _tsUpdated;
  String _title;
  String _description;
  int _group;
  String _image;
  double _price;
  String _edition;
  String _model;
  String _fuelType;
  String _year;
  String _transmission;
  int _category;
  int _brand;
  int _avgBid;

  int get id => _id;
  String get tsCreated => _tsCreated;
  String get tsUpdated => _tsUpdated;
  String get title => _title;
  String get description => _description;
  int get group => _group;
  String get image => _image;
  double get price => _price;
  String get edition => _edition;
  String get model => _model;
  String get fuelType => _fuelType;
  String get year => _year;
  String get transmission => _transmission;
  int get category => _category;
  int get brand => _brand;
  int get avgBid => _avgBid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['ts_created'] = _tsCreated;
    map['ts_updated'] = _tsUpdated;
    map['title'] = _title;
    map['description'] = _description;
    map['group'] = _group;
    map['image'] = _image;
    map['price'] = _price;
    map['edition'] = _edition;
    map['model'] = _model;
    map['fuel_type'] = _fuelType;
    map['year'] = _year;
    map['transmission'] = _transmission;
    map['category'] = _category;
    map['brand'] = _brand;
    map['avg_bid'] = _avgBid;
    return map;
  }

}