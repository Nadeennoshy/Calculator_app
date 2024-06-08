import 'package:calculator_app/constants.dart';
import 'package:calculator_app/helper/buttons.dart';
import 'package:calculator_app/widgets/buttons_container.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String expression = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: Text(
                    expression,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 32,
                    ),
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              width: double.infinity,
              child: Text(
                '= $result',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: 48,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        expression =
                            expression.substring(0, expression.length - 1);
                      });
                    },
                    icon: const Icon(
                      Icons.backspace_outlined,
                      color: Color(0xff5C5C5C),
                    )),
              ],
            ),
            const Divider(
              color: kSecondaryColor,
              thickness: 0.5,
              indent: 35,
              endIndent: 35,
            ),
            Expanded(
              flex: 6,
              child: GridView.builder(
                  itemCount: Buttons.buttonValues.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return ButtonsContainer(
                      onTap: () {
                        handleButtonPress(Buttons.buttonValues[index]);
                      },
                      buttonValue: Buttons.buttonValues[index],
                      buttonColor: buttonColor(Buttons.buttonValues[index]),
                      textColor: textColor(Buttons.buttonValues[index]),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Color buttonColor(String buttonValue) {
    if (buttonValue == Buttons.clear ||
        buttonValue == Buttons.power ||
        buttonValue == Buttons.per ||
        buttonValue == Buttons.divide ||
        buttonValue == Buttons.multiply ||
        buttonValue == Buttons.subtract ||
        buttonValue == Buttons.add ||
        buttonValue == Buttons.equal ||
        buttonValue == Buttons.dot ||
        buttonValue == Buttons.ans) {
      return const Color(0xff46384E);
    } else {
      return const Color(0xff211B24);
    }
  }

  Color textColor(String text) {
    if (text == Buttons.clear) {
      return const Color(0xffC70000);
    } else {
      return Colors.white;
    }
  }

  void handleButtonPress(String buttonValue) {
    setState(() {
      if (buttonValue == Buttons.clear) {
        expression = '';
        result = '';
      } else if (buttonValue == Buttons.ans) {
        expression = result;
        result = '';
      } else if (buttonValue == Buttons.add ||
          buttonValue == Buttons.subtract ||
          buttonValue == Buttons.multiply ||
          buttonValue == Buttons.divide ||
          buttonValue == Buttons.per||
          buttonValue == Buttons.power
          ) {
        if (expression.endsWith(Buttons.per) ||
            expression.endsWith(Buttons.add) ||
            expression.endsWith(Buttons.subtract) ||
            expression.endsWith(Buttons.multiply) ||
            expression.endsWith(Buttons.divide) ||
            expression.endsWith(Buttons.power)
            ) {
          null;
        } else {
          expression += buttonValue;
        }
      } else if (buttonValue == Buttons.equal) {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        double r = exp.evaluate(EvaluationType.REAL, ContextModel());
        result = r.toString();
      } else {
        expression += buttonValue;
      }
    });
  }
}
