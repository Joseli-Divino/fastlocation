import 'package:hive/hive.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';

class HiveStorage {
  static const String addressBoxName = 'address_history';

  // Inicializa o Hive e abre a caixa de armazenamento local
  static Future<void> initHive() async {
    await Hive.openBox(addressBoxName);
  }

  // Retorna a caixa de armazenamento do Hive
  static Box get addressBox => Hive.box(addressBoxName);

  // Adiciona um novo endereço ao histórico, convertendo o modelo para JSON
  static Future<void> addAddress(AddressModel address) async {
    final addressJson = address.toJson(); // Convertendo o modelo para JSON
    await addressBox.add(addressJson); // Salvando o JSON no Hive
  }

  // Retorna todos os endereços armazenados, convertendo de JSON para AddressModel
  static List<AddressModel> getAddresses() {
    final addresses = addressBox.values.toList();
    return addresses.map((e) => AddressModel.fromJson(Map<String, dynamic>.from(e))).toList();
  }

  // Limpa todo o histórico de endereços (se necessário)
  static Future<void> clearHistory() async {
    await addressBox.clear();
  }
}
