import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/home/controller/home_controller.dart';
import 'package:fastlocation/src/modules/home/components/search_input.dart';
import 'package:fastlocation/src/modules/home/components/last_searched_address.dart';
import 'package:fastlocation/src/shared/components/loading_widget.dart';
import 'package:fastlocation/src/modules/home/components/empty_state.dart';
import 'package:fastlocation/src/shared/storage/hive_storage.dart'; // Importar HiveStorage para limpar o histórico

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController cepController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text('FastLocation'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchInput(
              controller: cepController,
              onSearch: () {
                controller.searchAddress(cepController.text);
              },
            ),
            const SizedBox(height: 20),
            Observer(
              builder: (_) {
                if (controller.isLoading) {
                  return const LoadingWidget();
                }
                if (controller.errorMessage != null) {
                  return EmptyState(message: controller.errorMessage!);
                }
                if (controller.address != null) {
                  return LastSearchedAddress(address: controller.address);
                }
                return EmptyState(message: 'Digite um CEP válido.');
              },
            ),
            const SizedBox(height: 20),
            // Botão para ver o histórico
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/history'); // Navegar para a página de histórico
              },
              child: const Text('Ver Histórico'),
            ),
            const SizedBox(height: 10),
            // Botão para limpar o histórico
            ElevatedButton(
              onPressed: () async {
                await HiveStorage.clearHistory(); // Limpa o histórico de endereços
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Histórico limpo com sucesso!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 233, 210, 177), // Cor vermelha para destacar o botão de limpar
              ),
              child: const Text('Limpar Histórico'),
            ),
          ],
        ),
      ),
    );
  }
}
