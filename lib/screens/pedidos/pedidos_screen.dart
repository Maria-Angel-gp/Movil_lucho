import 'package:flutter/material.dart';
import 'package:luchosoft/constants.dart';
import 'package:luchosoft/screens/pedidos/components/body.dart';

class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBagroundColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Pedidos', style: TextStyle(color: kPrimaryColor),),
      backgroundColor: kBagroundColor,
      centerTitle: false,
    );
  }
}