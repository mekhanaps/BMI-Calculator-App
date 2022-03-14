import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/custom_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText})
      : super(key: key);
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kBigText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kResultText,
                  ),
                  Text(
                    bmiResult,
                    textAlign: TextAlign.center,
                    style: kBMIText,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyText,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
