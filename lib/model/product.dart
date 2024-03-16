import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  Product({
    required this.id,required this.title, required this.imageUrl, required this.description,
    this.isFavorite=false ,required this.price,
  });
  factory Product.fromJson(Map<String,dynamic> json){
    return Product(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      isFavorite: json['isFavorite'],
      price: json['price'],
    );
  }
  @override
  String toString() {
    return '$id , $title , $description , $price , $imageUrl ';
  }
  void toggleFavorite(){
    isFavorite=!isFavorite;
    notifyListeners();
  }
}
