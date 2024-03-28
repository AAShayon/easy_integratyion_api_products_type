// import 'package:easy_integration_api_products_type/model/usermodel.dart';
// import 'package:easy_integration_api_products_type/service/https_service.dart';
// import 'package:easy_integration_api_products_type/utils/constant.dart';
//
// class AuthService{
//   static final AuthService _singleton=AuthService._internal();
//   final _httpService=HttpService();
//   User? user;
//   factory AuthService(){
//     return _singleton;
//   }
//   AuthService._internal();
//
//   Future<bool> login(String username , String password) async {
//     try{
//   var response=await _httpService.post(Login_url, {
//     'username':username,
//     'password':password
//   });
//   if(response?.statusCode == 200 && response?.data != null){
//     user=User.fromJson(response!.data);
//     HttpService().setup(bearerToken: user!.token);
//     return true;
//   }
//     }
//     catch(e){
//       print(e);
//     }
//     return false;
//   }
//
//
//
// }
import 'package:easy_integration_api_products_type/model/usermodel.dart';
import 'package:easy_integration_api_products_type/service/https_service.dart';
import 'package:easy_integration_api_products_type/utils/constant.dart';

class AuthService{
  static final AuthService _singleton = AuthService._internal();
  final _httpservice=HttpService();
  User? user;
  factory AuthService(){
    return _singleton;
  }
  AuthService._internal();

  Future<bool> login(String username ,String password) async {
    try{
      final response=await _httpservice.post(Login_url, {
        'username':username,
        'password':password
      });
      if(response?.statusCode == 200 && response?.data != null ){
        user = User.fromJson(response!.data);
        HttpService().setup(bearerToken: user!.token);
        return true;
      }
    }
    catch(e){
      print(e);
    }

    return false;
  }
}