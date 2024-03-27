import 'package:dio/dio.dart';
import 'package:easy_integratyion_api_products_type/utils/constant.dart';

class HttpService {
  static final HttpService _singleton = HttpService._internal();

  final _dio = Dio();

  factory HttpService() {
    return _singleton;
  }

  HttpService._internal(){
    setup();
  }

  Future<void> setup({String? bearerToken}) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      if (bearerToken != null) {
        headers['Authorization'] = "BearerToken $bearerToken";
      }
      final options = BaseOptions(
          baseUrl: Login_url,
          headers: headers,
          validateStatus: (status) {
            if (status == null) {
              return false;
            }
            return status < 500;
          });
      _dio.options = options;
    } catch (e) {
      print(e);
    }
  }

  Future<Response?> post(String path, Map data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> get(String path) async {
    try{
      final response=await _dio.get(path);
      return response;
    }
    catch(e){
      print(e);
    }
    return null;
  }
}
