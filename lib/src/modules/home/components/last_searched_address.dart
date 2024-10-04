import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:geolocator/geolocator.dart';

class LastSearchedAddress extends StatelessWidget {
  final AddressModel? address;

  const LastSearchedAddress({Key? key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (address == null) {
      return const SizedBox.shrink();
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Último endereço consultado:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text('${address!.logradouro}, ${address!.bairro}'),
            Text('${address!.localidade}, ${address!.uf} - CEP: ${address!.cep}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final Position currentPosition = await _determinePosition(); // Obter localização atual
                _launchMap(context, currentPosition);
              },
              child: const Text('Traçar Rota'),
            ),
          ],
        ),
      ),
    );
  }

  // Função para obter a localização atual usando Geolocator
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está ativado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Os serviços de localização estão desativados.');
    }

    // Verifica as permissões de localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('As permissões de localização foram negadas.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('As permissões de localização foram permanentemente negadas.');
    }

    // Retorna a posição atual do dispositivo
    return await Geolocator.getCurrentPosition();
  }

  // Função para abrir o mapa e traçar a rota
  void _launchMap(BuildContext context, Position currentPosition) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;
      if (availableMaps.isNotEmpty) {
        final map = availableMaps.first; // Use o primeiro aplicativo de mapas disponível

        // Coordenadas de exemplo para o destino (você pode buscar coordenadas reais)
        await map.showDirections(
          origin: Coords(currentPosition.latitude, currentPosition.longitude),
          destination: Coords(-23.5505, -46.6333), // Substitua por coordenadas reais do endereço
          destinationTitle: address!.logradouro,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nenhum aplicativo de mapas disponível')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao abrir o mapa: $e')),
      );
    }
  }
}
