import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/modules/home/service/address_service.dart';
import 'package:fastlocation/src/shared/storage/hive_storage.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @observable
  AddressModel? address;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> searchAddress(String cep) async {
    isLoading = true;
    errorMessage = null;

    try {
      final result = await AddressService.getAddress(cep);

      if (result.logradouro.isEmpty) {
        errorMessage = 'Endereço não encontrado para o CEP informado';
      } else {
        address = result;

        // Salva o endereço no Hive após a consulta bem-sucedida
        await HiveStorage.addAddress(address!);
      }
    } catch (e) {
      errorMessage = 'Erro ao buscar o CEP';
    } finally {
      isLoading = false;
    }
  }
}
