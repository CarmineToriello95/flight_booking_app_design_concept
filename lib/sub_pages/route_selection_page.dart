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
  ),
  TextFieldData(
    Icon(
      Icons.flight_land,
      color: R.secondaryColor,
    ),
    "TO",
  ),
  TextFieldData(
    Icon(
      Icons.calendar_month,
      color: R.secondaryColor,
    ),
    "DATE",
  ),
  TextFieldData(
    Icon(
      Icons.people,
      color: R.secondaryColor,
    ),
    "TRAVELER",
  ),
  TextFieldData(
    Icon(
      Icons.flight_class,
      color: R.secondaryColor,
    ),
    "CLASS",
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
                onOptionClicked: (_) => isSelectionCompleted?.call(true),
              ),
              const SizedBox(
                height: 24.0,
              ),
              ...List.generate(
                fieldsData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CustomTextField(
                    labelText: fieldsData[index].label,
                    prefixIcon: fieldsData[index].icon,
                    mainColor: R.secondaryColor,
                    secondaryColor: R.tertiaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class TextFieldData {
  final Icon icon;
  final String label;

  TextFieldData(this.icon, this.label);
}
