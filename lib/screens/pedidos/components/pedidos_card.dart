import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luchosoft/constants.dart';
import 'package:luchosoft/models/pedidos.dart';

class PedidosCard extends StatelessWidget {
  final int itemIndex;

  //funcion para traer los datos
  final Pedido pedido;
  final VoidCallback press;


  const PedidosCard({
    Key? key,
    required this.itemIndex,
    required this.pedido, 
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    final DateFormat dateFormat = DateFormat('MM/dd/yyyy');
    final String formattedDate = dateFormat.format(pedido.fecha_pedido);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      elevation: 5,
      child: Container(
        height: 136,
        child: InkWell(
          onTap: press,
          child: Stack(
            children: [
              // Background container for the card
              Container(
                decoration: const BoxDecoration(
                  color: kBagroundColor2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Text(pedido.id_pedido.toString()),
                        ),
                      ],
                    ),
                    const SizedBox(width: kDefaultPadding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cliente Asociado: ${pedido.id_cliente}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Feha del Pedido: $formattedDate',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            'Descripción: ${pedido.observaciones}',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 1.5,
                                vertical: kDefaultPadding / 4,
                              ),
                              decoration: const BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(22),
                                  topLeft: Radius.circular(22),
                                ),
                              ),
                              child: Text(
                                'Total: \$${pedido.total_pedido}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
