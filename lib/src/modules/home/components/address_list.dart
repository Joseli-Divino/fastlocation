import 'package:flutter/material.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';

class AddressList extends StatelessWidget {
  final List<AddressModel> addresses;

  const AddressList({Key? key, required this.addresses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return ListTile(
          title: Text('${address.logradouro}, ${address.bairro}'),
          subtitle: Text('${address.localidade}, ${address.uf} - CEP: ${address.cep}'),
        );
      },
    );
  }
}
