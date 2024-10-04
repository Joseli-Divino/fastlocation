import 'package:dio/dio.dart';

class HttpClient {
  static final Dio dio = Dio(BaseOptions(
    baseUrl: 'https://viacep.com.br/ws/',
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000),
  ));

  static Future<Response> fetchAddressByCep(String cep) async {
    return await dio.get('$cep/json/');
  }
}
