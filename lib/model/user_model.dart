class UserModel {
  int? id;
  String? name;
  String? email;
  String? number;
  String? gender;
  String? mygender;
  String? pays;
  String? bio;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.number,
      this.gender,
      this.mygender,
      this.pays,
      this.bio,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    number = json['number'];
    gender = json['gender'];
    mygender = json['mygender'];
    pays = json['pays'];
    bio = json['bio'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['number'] = this.number;
    data['gender'] = this.gender;
    data['mygender'] = this.mygender;
    data['pays'] = this.pays;
    data['bio'] = this.bio;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}