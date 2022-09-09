class AccountModel {
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
  List<FileUrl>? fileUrl;

  AccountModel(
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
      this.updatedAt,
      this.fileUrl});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']??'';
    email = json['email']??'';
    number = json['number']??'';
    gender = json['gender']??'';
    mygender = json['mygender']??'';
    pays = json['pays']??'';
    bio = json['bio']??'';
    emailVerifiedAt = json['email_verified_at']??'';
    createdAt = json['created_at']??'';
    updatedAt = json['updated_at']??'';
    if (json['file_url'] != null) {
      fileUrl = <FileUrl>[];
      json['file_url'].forEach((v) {
        fileUrl!.add(new FileUrl.fromJson(v));
      });
    }
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
    if (this.fileUrl != null) {
      data['file_url'] = this.fileUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FileUrl {
  int? id;
  int? type;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  FileUrl(
      {this.id,
      this.type,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt});

  FileUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}