import 'package:fastlocation/src/shared/storage/hive_storage.dart';
import 'package:fastlocation/src/http/http_client.dart';

class AddressRepository {
  static Future<String> fetchAddress(String cep) async {
    final response = await HttpClient.fetchAddressByCep(cep);
    HiveStorage.addAddress(response.data['logradouro']);
    return response.data['logradouro'];
  }
}
