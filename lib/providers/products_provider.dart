import 'package:e_commerce/models/products_model.dart';
import 'package:e_commerce/services/products_service.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsModel? model;

  Future<void> fetchData() async {
    try {
      model = await ProductsService.fetchData();
    } catch (e) {
      print("Error fetching products: \$e");
    } finally {
      notifyListeners();
    }
  }
}
