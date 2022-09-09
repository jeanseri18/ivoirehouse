class PostModel {
  int? id;
  String? title;
  String? description;
  String? isgo;
  String? date;
  String? image;
  String? locate;
  String? deplacement;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? name; String? number;
  List<FileUrl>? fileUrl;
  String? country;

  PostModel(
      {this.id,
      this.title,
      this.description,
      this.isgo,
      this.date,
      this.image,
      this.locate,
      this.deplacement,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.name,
       this.number,
      this.fileUrl,
      this.country});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isgo = json['isgo'];
    date = json['date'];
    image = json['image'];
    locate = json['locate'];
    deplacement = json['deplacement'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    name = json['name'];
    number = json['number'];
    if (json['file_url'] != null) {
      fileUrl = <FileUrl>[];
      //  fileUrl = new List<Result>();||
      json['file_url'].forEach((v) {
        fileUrl!.add(FileUrl.fromJson(v));
      });
    }
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['isgo'] = this.isgo;
    data['date'] = this.date;
    data['image'] = this.image;
    data['locate'] = this.locate;
    data['deplacement'] = this.deplacement;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['name'] = this.name;
    if (this.fileUrl != null) {
      data['file_url'] = this.fileUrl!.map((v) => v.toJson()).toList();
    }
    data['country'] = this.country;
    return data;
  }
}

class FileUrl {
  int? type;
  String? image;
  int? userId;

  FileUrl({this.type, this.image, this.userId});

  FileUrl.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    image = json['image'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    return data;
  }
}
