import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luchosoft/constants.dart';
import 'package:luchosoft/models/pedidos.dart';
import 'package:luchosoft/screens/detalles/detalles_screen.dart';
import 'package:luchosoft/screens/pedidos/components/categoria_list.dart';
import 'package:luchosoft/screens/pedidos/components/pedidos_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Pedido> pedidos = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchPedidos();
  }

  Future<void> fetchPedidos() async {
    final response = await http.get(
      Uri.parse('https://api-luchosoft-mysql.onrender.com/ventas/pedidos'),
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      setState(() {
        pedidos = Pedido.fromJsonList(data);
      });
    } else {
      // Handle error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error no se ha podido conectar con la API'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
      print('Error la API no cargó: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(kDefaultPadding),
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 4,
            ),
            decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 228, 200, 200).withOpacity(0.4),
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: SvgPicture.asset("assets/icons/search.svg"),
                  hintText: 'Buscar',
                  hintStyle: const TextStyle(color: Colors.black)),
              onChanged: (value) {
                setState(() {
                  pedidos = pedidos.where((pedido) {
                    return pedido.observaciones
                        .toLowerCase()
                        .contains(value.toLowerCase());
                  }).toList();
                });
              },
            ),
          ),
          const CategoryList(),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
              child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                    color: kBagroundColor2,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
              ),
              ListView.builder(
                  //En esta parte se pone el nombre de la clase donde esta listando los datos con .lenght
                  itemCount: pedidos.length,
                  itemBuilder: (context, index) => PedidosCard(
                        itemIndex: index,
                        pedido: pedidos[index],
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetallesScreen()));
                        },
                      ))
            ],
          ))
        ],
      ),
    );
  }
}
