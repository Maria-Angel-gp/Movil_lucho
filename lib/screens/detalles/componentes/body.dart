import 'package:flutter/material.dart';
import 'package:luchosoft/constants.dart';

class Body2 extends StatelessWidget {
  const Body2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          height: 200,
          decoration: const BoxDecoration(
              color: kBagroundColor2,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
        )
      ],
    );
  }
}
