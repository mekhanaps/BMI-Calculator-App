import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.colour, this.cardChild, this.onPress})
      : super(key: key);
  final Color colour;
  final Widget? cardChild;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
