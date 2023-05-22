import 'package:flight_booking_concept_ui/utils/hard_coded_data.dart';
import 'package:flight_booking_concept_ui/widgets/custom_text_field.dart';
import 'package:flight_booking_concept_ui/utils/r.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_option_selector.dart';

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
                options: HardCodedData.routePageRouteOptions,
                onOptionClicked: (_) {
                  _fillFields();
                  isSelectionCompleted?.call(true);
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              ...List.generate(
                HardCodedData.routePageFieldsData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CustomTextField(
                    controller:
                        HardCodedData.routePageFieldsData[index].controller,
                    labelText: HardCodedData.routePageFieldsData[index].label,
                    prefixIcon: HardCodedData.routePageFieldsData[index].icon,
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
    for (var field in HardCodedData.routePageFieldsData) {
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
