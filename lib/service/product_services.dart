import 'package:easy_integratyion_api_products_type/model/ProductModel.dart';
import 'package:easy_integratyion_api_products_type/service/https_service.dart';
import 'package:easy_integratyion_api_products_type/utils/constant.dart';

class ProductService{
  static final ProductService _singleton=ProductService._internal();

  final _httpService=HttpService();

  factory ProductService(){
    return _singleton;
  }
  ProductService._internal();

  Future<List<Products>?> getAllProducts() async{
    try{
      final response=await _httpService.get(All_products);
      if(response?.statusCode == 200 && response?.data != null){
        List data=response!.data['products'];
        List<Products> products=data.map((e) => Products.fromJson(e)).toList();
        return products;
      }
    }
    catch(e){
      print(e);
    }
  }
}