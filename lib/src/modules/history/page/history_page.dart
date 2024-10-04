import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/history/controller/history_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/home/components/address_list.dart';
import 'package:fastlocation/src/modules/home/components/empty_state.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Carrega o histórico assim que a página é carregada
    controller.loadHistory();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Consultas'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.history.isEmpty) {
            return const EmptyState(message: 'Nenhum histórico encontrado.');
          }
          return AddressList(addresses: controller.history);
        },
      ),
    );
  }
}
