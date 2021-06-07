class ContactModel {
  String sId;
  String email;
  String avatar;
  String firstName;
  String lastName;
  String phone;

  ContactModel(
      {this.sId,
      this.email,
      this.avatar,
      this.firstName,
      this.lastName,
      this.phone});

  ContactModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    avatar = json['avatar'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    return data;
  }
}
