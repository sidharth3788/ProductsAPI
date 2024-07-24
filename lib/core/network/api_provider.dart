import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../module/model/product_response.dart';

class ApiProvider {
  Future<List<ShopItem>> fetchProducts() async {
    try {
      var url = Uri.parse('https://fakestoreapi.com/products');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<ShopItem> fetchedProducts = jsonResponse.map((json) {
          return ShopItem(
            id: json['id'],
            title: json['title'],
            price: json['price'].toDouble(),
            description: json['description'],
            category: _parseCategory(json['category']),
            image: json['image'],
            rating: Rating(
              rate: json['rating']['rate'].toDouble(),
              count: json['rating']['count'],
            ),
          );
        }).toList();

        return fetchedProducts;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  Category _parseCategory(String category) {
    switch (category) {
      case 'ELECTRONICS':
        return Category.electronics;
      case 'JEWELERY':
        return Category.jewelery;
      case 'MEN_S_CLOTHING':
        return Category.mensclothing;
      case 'WOMEN_S_CLOTHING':
        return Category.womenclothing;
      default:
        return Category.electronics;
    }
  }
}
