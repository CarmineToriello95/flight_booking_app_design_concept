import 'package:flutter/material.dart';

class FadingItemListController {
  late List<AnimationController> controllers;

  void showItems() {
    for (int i = 0; i < controllers.length; i++) {
      Future.delayed(
        Duration(milliseconds: 400 * i),
        () {
          controllers[i].forward();
        },
      );
    }
  }
}
