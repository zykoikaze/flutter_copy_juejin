import 'package:dio/dio.dart';
Dio dio = new Dio(BaseOptions(
  // baseUrl: 'https://web-api.juejin.im/query',
  headers: {
    // "Content-Type":"application/json;charset=UTF-8",
    "X-Agent":"Juejin/Web"
  },
  contentType: 'application/json;charset=UTF-8'
));
class DioUtils{  
  static get(String url,{Map<String,dynamic> params}) async{
    Response response = await dio.get(url, queryParameters: params);
    return response.data;
  }
  static post(String url,Map<String,dynamic> params) async{
    Response response = await dio.post(url,data: params);
    return response.data;
  }
}