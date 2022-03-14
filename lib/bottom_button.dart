import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kBottomButtonText,
          ),
        ),
        color: kBottomCardColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
      ),
    );
  }
}
