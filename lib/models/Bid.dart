/// id : 1
/// ts_created : "2022-07-12T09:40:38.040551Z"
/// ts_updated : "2022-07-12T09:40:38.047151Z"
/// text : "Bid 01"
/// description : "This a bid descriptions"
/// price : 100.0
/// is_winner : false
/// user : 3
/// vehicle : 1

class Bid {
  Bid({
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

  Bid.fromJson(dynamic json) {
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

  static List<Bid> fromJsonList(jsonList) {
    return jsonList.map<Bid>((obj) => Bid.fromJson(obj)).toList();
  }

}