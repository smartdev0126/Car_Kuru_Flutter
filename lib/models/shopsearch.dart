class VehicleSearch {
  int id;
  double avgRate;
  int totalRate;
  double deliveryCharge;
  String tsCreated;
  String tsUpdated;
  String title;
  String address;
  double lat;
  bool isKitchen;
  bool isRestaurant;
  bool isPickup;
  bool isFoodDelivery;
  int promotionType;
  double lng;
  String logo;
  String image;
  int category;

  VehicleSearch(
      {this.id,
        this.avgRate,
        this.totalRate,
        this.deliveryCharge,
        this.tsCreated,
        this.tsUpdated,
        this.title,
        this.address,
        this.lat,
        this.isKitchen,
        this.isRestaurant,
        this.isPickup,
        this.isFoodDelivery,
        this.promotionType,
        this.lng,
        this.logo,
        this.image,
        this.category});

  VehicleSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    avgRate = json['avg_rate'];
    totalRate = json['total_rate'];
    deliveryCharge = json['delivery_charge'];
    tsCreated = json['ts_created'];
    tsUpdated = json['ts_updated'];
    title = json['title'];
    address = json['address'];
    lat = json['lat'];
    isKitchen = json['is_kitchen'];
    isRestaurant = json['is_restaurant'];
    isPickup = json['is_pickup'];
    isFoodDelivery = json['is_food_delivery'];
    promotionType = json['promotion_type'];
    lng = json['lng'];
    logo = json['logo'];
    image = json['image'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avg_rate'] = this.avgRate;
    data['total_rate'] = this.totalRate;
    data['delivery_charge'] = this.deliveryCharge;
    data['ts_created'] = this.tsCreated;
    data['ts_updated'] = this.tsUpdated;
    data['title'] = this.title;
    data['address'] = this.address;
    data['lat'] = this.lat;
    data['is_kitchen'] = this.isKitchen;
    data['is_restaurant'] = this.isRestaurant;
    data['is_pickup'] = this.isPickup;
    data['is_food_delivery'] = this.isFoodDelivery;
    data['promotion_type'] = this.promotionType;
    data['lng'] = this.lng;
    data['logo'] = this.logo;
    data['image'] = this.image;
    data['category'] = this.category;
    return data;
  }

  static List<VehicleSearch> fromJsonList(jsonList) {
    return jsonList.map<VehicleSearch>((obj) => VehicleSearch.fromJson(obj)).toList();
  }
}