import 'package:emirates_airlines_concept_ui/widgets/custom_text_field.dart';
import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_option_selector.dart';

final List<TextFieldData> fieldsData = [
  TextFieldData(
    Icon(
      Icons.flight_takeoff,
      color: R.secondaryColor,
    ),
    "FROM",
    TextEditingController(),
    "Dabaca",
  ),
  TextFieldData(
    Icon(
      Icons.flight_land,
      color: R.secondaryColor,
    ),
    "TO",
    TextEditingController(),
    "Almedy",
  ),
  TextFieldData(
    Icon(
      Icons.calendar_month,
      color: R.secondaryColor,
    ),
    "DATE",
    TextEditingController(),
    "May 19",
  ),
  TextFieldData(
    Icon(
      Icons.people,
      color: R.secondaryColor,
    ),
    "TRAVELER",
    TextEditingController(),
    "2",
  ),
  TextFieldData(
    Icon(
      Icons.flight_class,
      color: R.secondaryColor,
    ),
    "CLASS",
    TextEditingController(),
    "Economy",
  ),
];

final List<CustomOptionSelectorData> routeData = [
  CustomOptionSelectorData(
    text: "One way",
    id: "0",
    leftBorder: false,
    topBorder: false,
  ),
  CustomOptionSelectorData(
    text: "Roundtrip",
    id: "1",
    topBorder: false,
  ),
  CustomOptionSelectorData(
    text: "Multiple",
    id: "2",
    topBorder: false,
    rightBorder: false,
  )
];

class RouteSelectionPage extends StatelessWidget {
  final Function(bool)? isSelectionCompleted;
  const RouteSelectionPage({
    super.key,
    required this.isSelectionCompleted,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOptionSelector(
                options: routeData,
                onOptionClicked: (_) {
                  _fillFields();
                  isSelectionCompleted?.call(true);
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              ...List.generate(
                fieldsData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CustomTextField(
                    controller: fieldsData[index].controller,
                    labelText: fieldsData[index].label,
                    prefixIcon: fieldsData[index].icon,
                    mainColor: Colors.white,
                    secondaryColor: R.tertiaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void _fillFields() {
    for (var field in fieldsData) {
      for (int i = 0; i < field.text.length; i++) {
        Future.delayed(
          Duration(milliseconds: 100 * i),
          () => field.controller.text += field.text[i],
        );
      }
    }
  }
}

class TextFieldData {
  final Icon icon;
  final String label;
  final TextEditingController controller;
  final String text;

  TextFieldData(
    this.icon,
    this.label,
    this.controller,
    this.text,
  );
}
