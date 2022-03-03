import 'dart:convert';
import 'package:infinite_pagination/NewArrival.dart';
import 'package:infinite_pagination/NewCollectionProductModel.dart';

import 'package:http/http.dart' as http;

/**
 * This is a Service Class. 
 * This Service Class is used for New COllection Product.
 * 
 */

class NewCollectionProductService {
  static var product;
  static Future<NewCollectionProductModel?> getNewCollectionProductService(
      {int pageNumber = 0}) async {
    try {
      final response = await http.get(Uri.parse(
          "https://www.moharaj.com.bd/api/new/collection/products?page=$pageNumber"));
      // print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decode = jsonDecode(response.body);
        product = NewCollectionProductModel.fromJson(decode);
        return product;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      throw Exception();
    }
  }
}
