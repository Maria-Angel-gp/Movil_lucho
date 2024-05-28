import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luchosoft/constants.dart';
import 'package:luchosoft/screens/detalles/componentes/body.dart';

class DetallesScreen extends StatelessWidget {
  const DetallesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBagroundColor,
      appBar: buildAppBar(context),
      body: Body2(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBagroundColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaultPadding),
        icon: SvgPicture.asset("assets/icons/flecha-izquierda.svg"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'Salir'.toUpperCase(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
