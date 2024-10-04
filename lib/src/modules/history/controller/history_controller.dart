import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/shared/storage/hive_storage.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryController with _$HistoryController;

abstract class _HistoryController with Store {
  @observable
  List<AddressModel> history = [];

  @observable
  bool isLoading = false;

  // Modifique para retornar um Future<void>
  @action
  Future<void> loadHistory() async {
    isLoading = true;
    // Carrega os endereços do Hive
    history = HiveStorage.getAddresses().cast<AddressModel>();
    isLoading = false;
  }
}
