import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:emirates_airlines_concept_ui/widgets/fading_item_list/fading_item_list.dart';
import 'package:emirates_airlines_concept_ui/widgets/fading_item_list/fading_item_list_controller.dart';
import 'package:emirates_airlines_concept_ui/widgets/flights_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:snake_button/snake_button.dart';

List<FlightData> flightsData = List.generate(
  5,
  (index) => FlightData(
    "DBC",
    "Dabaca",
    "MAY 19",
    "ADY",
    "Almedy",
    "KB7$index",
    "1h 35m",
    "8:35 AM",
  ),
);

class MyFlightsPage extends StatefulWidget {
  const MyFlightsPage({super.key});

  @override
  State<MyFlightsPage> createState() => _MyFlightsPageState();
}

class _MyFlightsPageState extends State<MyFlightsPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final SnakeButtonController _snakeButtonController;
  late final FadingItemListController _fadingItemListController;

  @override
  void initState() {
    super.initState();
    _snakeButtonController = SnakeButtonController();
    _fadingItemListController = FadingItemListController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );

    _animationController.forward().whenComplete(
      () {
        _fadingItemListController.showItems();
        _snakeButtonController.toggle();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SnakeButton(
        controller: _snakeButtonController,
        snakeAnimationDuration: const Duration(milliseconds: 500),
        snakeColor: R.secondaryColor,
        snakeWidth: 2.0,
        borderRadius: 20.0,
        child: SizedBox(
          height: 70,
          width: 70,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: R.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: R.primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: _buildHeader,
            ),
            const SizedBox(
              height: 32.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "My flights",
                style: TextStyle(
                  color: R.primaryColor,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    height: (1 - _animationController.value) * 600,
                  );
                }),
            Flexible(
              child: _buildFlightsListWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildHeader => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _snakeButtonController.toggle(),
            child: Icon(
              Icons.menu,
              color: R.primaryColor,
            ),
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: R.primaryColor,
            ),
          )
        ],
      );

  Widget _buildFlightsListWidget() => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: R.primaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: FadingItemList(
          fadingItemListController: _fadingItemListController,
          listItems: List.generate(
            5,
            (index) => FlightsListItemWidget(
              flightData: flightsData[index],
            ),
          ),
        ),
      );
}

class AnimatedListItemData {
  final Widget widget;
  final AnimationController animationController;

  AnimatedListItemData(this.widget, this.animationController);
}
