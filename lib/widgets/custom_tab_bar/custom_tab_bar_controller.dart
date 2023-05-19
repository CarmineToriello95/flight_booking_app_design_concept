import 'package:flutter/material.dart';

class CustomTabBarController {
  late TabController tabController;

  void nextTab() {
    final currentIndex = tabController.index;
    if (!isLastTab) {
      tabController.animateTo(currentIndex + 1);
    }
  }

  void previousTab() {
    final currentIndex = tabController.index;
    if (currentIndex > 0) {
      tabController.animateTo(currentIndex - 1);
    }
  }

  int get currentIndex => tabController.index;

  bool get isLastTab => currentIndex == tabController.length - 1;
}
