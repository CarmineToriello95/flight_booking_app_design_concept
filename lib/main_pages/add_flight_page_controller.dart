import 'package:flight_booking_concept_ui/widgets/custom_tab_bar/custom_tab_bar_controller.dart';
import 'package:flight_booking_concept_ui/widgets/fade_in_out_widget/fade_in_out_widget_controller.dart';
import 'package:flutter/material.dart';

class AddFlightPageController {
  late CustomTabBarController customTabBarController;
  late ValueNotifier<int> pageNotifier;
  late FadeInOutWidgetController fadeInOutWidgetController;

  void nextTab() {
    if (!customTabBarController.isLastTab) {
      fadeInOutWidgetController.hide();
      customTabBarController.nextTab();
      Future.delayed(
        const Duration(milliseconds: 500),
        () => pageNotifier.value = customTabBarController.currentIndex,
      ).whenComplete(
        () {
          fadeInOutWidgetController.show();
        },
      );
    }
  }
}
