// Mengonversi data ke format JSON
class MyUser {
  final String fullname;
  final String email;
  final String username;

  MyUser({
    required this.fullname,
    required this.email,
    required this.username,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "username": username,
    };
  }

  factory MyUser.fromJson(Map<String, dynamic> json) {
    return MyUser(
      fullname: json["fullname"],
      email: json["email"],
      username: json["username"],
    );
  }
}

class DataRecipe {
  String? name;
  String? category;
  String? recipe;
  String? avatar;
  String? upload;

  DataRecipe(
      {this.name,
      this.category,
      this.recipe,
      this.upload,
      this.avatar});

  DataRecipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    category = json['category'];
    recipe = json['recipe'];
    avatar = json['avatar'];
    upload = json['upload'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['category'] = this.category;
    data['recipe'] = this.recipe;
    data['avatar'] = this.avatar;
    data['upload'] = this.upload;
    return data;
  }

  Map<String, dynamic> toJson2() {
    final Map<String, dynamic> data2 = new Map<String, dynamic>();
    data2['name'] = this.name;
    data2['category'] = this.category;
    data2['recipe'] = this.recipe;
    data2['avatar'] = this.avatar;
    return data2;
  }

  Map<String, dynamic> toJson3() {
    final Map<String, dynamic> datafood = new Map<String, dynamic>();
    datafood['name'] = this.name;
    datafood['category'] = this.category;
    datafood['recipe'] = this.recipe;
    datafood['avatar'] = this.avatar;
    return datafood;
  }

  Map<String, dynamic> toJson4() {
    final Map<String, dynamic> databeverage = new Map<String, dynamic>();
    databeverage['name'] = this.name;
    databeverage['category'] = this.category;
    databeverage['recipe'] = this.recipe;
    databeverage['avatar'] = this.avatar;
    return databeverage;
  }

  Map<String, dynamic> toJson5() {
    final Map<String, dynamic> datapastry = new Map<String, dynamic>();
    datapastry['name'] = this.name;
    datapastry['category'] = this.category;
    datapastry['recipe'] = this.recipe;
    datapastry['avatar'] = this.avatar;
    return datapastry;
  }
}
