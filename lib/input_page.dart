import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_card.dart';
import 'top_card_content.dart';
import 'constants.dart';
import 'result_page.dart';
import 'round_icon_button.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CustomCard(
                  onPress: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  colour: gender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const TopCardContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  onPress: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  colour: gender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: const TopCardContent(
                    text: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: CustomCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBigText,
                      ),
                      const Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: kGreyColor,
                      thumbColor: kBottomCardColor,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: CustomCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: kLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kBigText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CustomCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: kLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBigText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
