class Users {
  int id;
  String tsCreated;
  String tsUpdated;
  String name;
  String businessName;
  String phone;
  String email;
  String mobileId;
  String address;
  String password;
  int userType;
  int status;

  Users(
      {this.id,
        this.tsCreated,
        this.tsUpdated,
        this.name,
        this.businessName,
        this.phone,
        this.email,
        this.mobileId,
        this.address,
        this.password,
        this.userType,
        this.status});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tsCreated = json['ts_created'];
    tsUpdated = json['ts_updated'];
    name = json['name'];
    businessName = json['business_name'];
    phone = json['phone'];
    email = json['email'];
    mobileId = json['mobile_id'];
    address = json['address'];
    password = json['password'];
    userType = json['user_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ts_created'] = this.tsCreated;
    data['ts_updated'] = this.tsUpdated;
    data['name'] = this.name;
    data['business_name'] = this.businessName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['mobile_id'] = this.mobileId;
    data['address'] = this.address;
    data['password'] = this.password;
    data['user_type'] = this.userType;
    data['status'] = this.status;
    return data;
  }


  static List<Users> fromJsonList(jsonList) {
    return jsonList.map<Users>((obj) => Users.fromJson(obj)).toList();
  }
}