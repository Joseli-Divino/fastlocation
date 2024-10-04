import 'package:flutter/material.dart';
import 'package:fastlocation/src/routes/app_routes.dart';
import 'package:fastlocation/src/shared/storage/hive_storage.dart'; // Importar HiveStorage
import 'package:hive_flutter/hive_flutter.dart'; // Importar Hive Flutter para inicializar corretamente o Hive

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter esteja corretamente inicializado
  await Hive.initFlutter(); // Inicializa o Hive para Flutter
  await HiveStorage.initHive(); // Inicializa a caixa de armazenamento

  runApp(const FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  const FastLocationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: AppRoutes.routes,
      initialRoute: '/',
    );
  }
}
