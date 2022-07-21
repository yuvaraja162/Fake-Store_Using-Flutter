import 'dart:convert';

import 'dart:ffi';

List<Model> productsFromJson(dynamic str) =>
    List<Model>.from((str).map((x) => Model.fromJson(x)));

class Model {
  int? id;
  String? title;
  String? price;
  String? category;
  String? description;
  String? image;
  Rating? rating;

  Model(this.id, this.category, this.description, this.title, this.price,
      this.image, this.rating);

  Model.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'].toString();
    category = json['category'];
    description = json['description'];
    image = json['image'];
    rating = Rating.fromJson(json['rating']);
  }
  Map<dynamic, dynamic> toJson() {
    final data = <dynamic, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['image'] = image;

    return data;
  }
}

List<Rating> productFromJson(dynamic str) =>
    List<Rating>.from((str).map((x) => Model.fromJson(x)));

class Rating {
  late String rate;
  int? count;

  Rating(this.rate, this.count);

  Rating.fromJson(Map<dynamic, dynamic> json) {
    rate = json['rate'].toString();
    count = json['count'];
  }
  Map<dynamic, dynamic> toJson() {
    final data = <dynamic, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    // print(data);
    return data;
  }

  // static Rating? productFromJson(json) {}
}
