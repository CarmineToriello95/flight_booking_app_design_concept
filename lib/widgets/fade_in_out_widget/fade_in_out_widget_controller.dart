import 'package:flutter/material.dart';

class FadeInOutWidgetController {
  late ValueNotifier<bool> notifier;

  void show() => notifier.value = true;

  void hide() => notifier.value = false;
}
