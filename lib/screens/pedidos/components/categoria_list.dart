import 'package:flutter/material.dart';
import 'package:luchosoft/constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  List Categories = ['Pendientes', 'Cancelados', 'Vendidos'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              right: index == Categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
                color: index == selectedIndex
                    ? const Color.fromARGB(255, 228, 200, 200).withOpacity(0.4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6)),
            child: Text(
              Categories[index],
            ),
          ),
        ),
      ),
    );
  }
}