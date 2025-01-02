import 'package:dio/dio.dart';
import 'package:e_commerce/models/products_model.dart';

class ProductsService{
  static Dio dio = Dio();
  static const url = 'https://student.valuxapps.com/api/home';
  static Future<ProductsModel?> fetchData() async{
    try{
      Response response = await dio.get(url);
      var model = ProductsModel.getJson(response.data);

      if(response.statusCode == 200 && model.status){
        return model;
      }
      return null;
    }catch(ex){
      throw Exception("Couldn't fetch data : $ex");
    }
  }
}