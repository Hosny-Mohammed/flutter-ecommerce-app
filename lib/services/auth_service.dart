import 'package:dio/dio.dart';
import 'package:e_commerce/models/user_model.dart';

class AuthService{
  static Dio dio = Dio();
  static const urlLogin = 'https://student.valuxapps.com/api/login';
  static const urlSignup = 'https://student.valuxapps.com/api/register';

  static Future<bool> login({required String email, required String password}) async{
    try{
      Map cred = {
        "email" : email,
        "password" : password
      };

      Response response = await dio.post(urlLogin,data: cred);
      var model = UserModel.getJson(response.data);
      if(response.statusCode == 200 && model.status){
        return true;
      }
      else{
        return false;
      }
    }catch(ex){
      throw Exception("Couldn't log in: $ex");
    }
  }

  static Future<bool> signup({required String name, required String email, required String password, required String phone}) async{
    try{
      Map cred = {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone
      };

      Response response = await dio.post(urlSignup, data: cred);
      var model = UserModel.getJson(response.data);

      if(response.statusCode == 200 && model.status){
        return true;
      }
      return false;
    }catch(ex){
      throw Exception("Couldn't register: $ex");
    }
  }
}