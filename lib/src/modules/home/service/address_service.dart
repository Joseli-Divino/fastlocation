import 'package:fastlocation/src/http/http_client.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';

class AddressService {
  static Future<AddressModel> getAddress(String cep) async {
    try {
      final response = await HttpClient.fetchAddressByCep(cep);
      return AddressModel.fromJson(response.data); // Converte o JSON em AddressModel
    } catch (e) {
      throw Exception('Erro ao buscar o CEP'); // Lança uma exceção se houver erro
    }
  }
}
