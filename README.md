# FastLocation

FastLocation é um aplicativo Flutter que permite aos usuários consultar endereços utilizando o CEP, visualizar um histórico de consultas e traçar rotas para locais específicos.

## Requisitos

- Flutter 2.0 ou superior
- Dart 2.12 ou superior
- Android Studio ou Visual Studio Code
- Um dispositivo Android/iOS ou um emulador

## Instalação

### 1. Clonar o Repositório

Para clonar o repositório, execute o seguinte comando no seu terminal:

```bash
git clone https://github.com/joseli-divino/fastlocation.git
```


### 2. Navegar para o Diretório do Projeto
Após clonar o repositório, navegue até o diretório do projeto:

```bash
cd fastlocation
```

### 3. Instalar Dependências
Certifique-se de que você tenha o Flutter instalado corretamente. Em seguida, instale as dependências do projeto com o seguinte comando:

```bash
flutter pub get
```

### 4. Configurar Permissões
Para o funcionamento correto do aplicativo, você precisa adicionar permissões no arquivo de configuração.

#### Android
Abra o arquivo android/app/src/main/AndroidManifest.xml e adicione as seguintes permissões:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

#### iOS
Abra o arquivo ios/Runner/Info.plist e adicione as seguintes permissões:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Precisamos acessar sua localização para traçar a rota.</string>
```

### 5. Gerar Código com Build Runner
Após fazer alterações nos arquivos que usam MobX, você deve gerar os arquivos necessários. Execute o seguinte comando:

```bash
flutter pub run build_runner build
```

Se você preferir que o build_runner fique atento a alterações e gere automaticamente, use:

```bash
flutter pub run build_runner watch
```

### 6. Executar o Aplicativo
Agora você pode executar o aplicativo em um dispositivo conectado ou em um emulador. Use o seguinte comando:

```bash
flutter run
```

### Funcionalidades
 - Consultar endereços usando o CEP.
 - Visualizar histórico de endereços consultados.
 - Traçar rotas para a localização atual a partir do último endereço consultado.


### Contribuição
Contribuições são bem-vindas! Se você tiver alguma sugestão ou correção, sinta-se à vontade para abrir um issue ou enviar um pull request.
