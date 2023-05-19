import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:emirates_airlines_concept_ui/widgets/custom_tab_bar/custom_tab_bar_controller.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final Function(int)? onTabTap;
  final CustomTabBarController customTabBarController;
  const CustomTabBar({
    super.key,
    this.onTabTap,
    required this.customTabBarController,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    widget.customTabBarController.tabController = _tabController;
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 1.0,
            child: Container(
              height: 0.5,
              width: 500,
              color: R.tertiaryColor,
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: false,
            indicatorColor: R.secondaryColor,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            indicatorWeight: 3.0,
            labelColor: R.secondaryColor,
            unselectedLabelColor: R.tertiaryColor,
            splashFactory: NoSplash.splashFactory,
            onTap: (value) =>
                _tabController.index = _tabController.previousIndex,
            tabs: const [
              Tab(
                text: "Route",
              ),
              Tab(
                text: "Flight",
              ),
              Tab(
                text: "Seat",
              ),
              Tab(
                text: "Checkout",
              ),
            ],
          ),
        ],
      );
}
