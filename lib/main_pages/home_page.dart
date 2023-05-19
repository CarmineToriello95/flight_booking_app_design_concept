import 'package:emirates_airlines_concept_ui/sub_pages/my_flights_list_page.dart';
import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:emirates_airlines_concept_ui/widgets/fade_in_out_widget/fade_in_out_widget.dart';
import 'package:emirates_airlines_concept_ui/widgets/fade_in_out_widget/fade_in_out_widget_controller.dart';
import 'package:emirates_airlines_concept_ui/widgets/fading_item_list/fading_item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:snake_button/snake_button.dart';

import 'add_flight_page_controller.dart';
import 'add_flight_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _sheetAnimationController;
  late final SnakeButtonController _snakeButtonController;
  late final FadingItemListController _fadingItemListController;
  late final AddFlightPageController _addFlightPageController;
  late final FadeInOutWidgetController _sheetContentFadeInOutController;
  late final FadeInOutWidgetController _headerFadeInOutController;
  late final ValueNotifier<int> _currentPage;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _snakeButtonController = SnakeButtonController();
    _fadingItemListController = FadingItemListController();
    _sheetContentFadeInOutController = FadeInOutWidgetController();
    _headerFadeInOutController = FadeInOutWidgetController();
    _sheetAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 600,
      ),
    );

    _sheetAnimationController.forward().whenComplete(
      () {
        _fadingItemListController.showItems();
        _snakeButtonController.toggle();
      },
    );

    _currentPage = ValueNotifier(0);
    _addFlightPageController = AddFlightPageController();

    pages = [
      MyFlightsListPage(
        fadingItemListController: _fadingItemListController,
      ),
      AddFlightPage(
        isSingleTabSelectionCompleted: (isCompleted) {
          isCompleted
              ? _snakeButtonController.show()
              : _snakeButtonController.hide(from: 0.3);
        },
        addFlightPageController: _addFlightPageController,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: SnakeButton(
          controller: _snakeButtonController,
          snakeAnimationDuration: const Duration(milliseconds: 500),
          snakeColor: R.secondaryColor,
          snakeWidth: 2.0,
          borderRadius: 20.0,
          child: SizedBox(
            height: 70,
            width: 70,
            child: _buildFloatingButton,
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
                child: FadeInOutWidget(
                  slideDuration: const Duration(milliseconds: 500),
                  fadeInOutWidgetController: _headerFadeInOutController,
                  child: ValueListenableBuilder<int>(
                    valueListenable: _currentPage,
                    builder: (_, value, __) => value == 0
                        ? Text(
                            "My flights",
                            style: TextStyle(
                              color: R.primaryColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Text(
                            "Add flight",
                            style: TextStyle(
                              color: R.primaryColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              AnimatedBuilder(
                animation: _sheetAnimationController,
                builder: (context, child) => Container(
                  height: (1 - _sheetAnimationController.value) * 600,
                ),
              ),
              Flexible(
                child: _buildBottomSheet,
              ),
            ],
          ),
        ),
      );

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

  Widget get _buildBottomSheet => Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: R.primaryColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: FadeInOutWidget(
          slideDuration: const Duration(milliseconds: 500),
          slideEndingOffset: const Offset(0, 0.05),
          fadeInOutWidgetController: _sheetContentFadeInOutController,
          child: ValueListenableBuilder<int>(
            valueListenable: _currentPage,
            builder: (_, value, __) => pages[value],
          ),
        ),
      );

  Widget get _buildFloatingButton => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: R.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () => _onMainButtonClick(),
        child: ValueListenableBuilder<int>(
          valueListenable: _currentPage,
          builder: (_, value, __) => Icon(
            value == 0 ? Icons.add : Icons.arrow_forward_ios,
            color: R.primaryColor,
          ),
        ),
      );

  void _onMainButtonClick() {
    _snakeButtonController.hide(from: 0.3);
    if (_currentPage.value < pages.length - 1) {
      _sheetContentFadeInOutController.hide();
      _headerFadeInOutController.hide();

      Future.delayed(const Duration(milliseconds: 500), () {
        _currentPage.value = _currentPage.value + 1;
      }).whenComplete(() {
        _sheetContentFadeInOutController.show();
        _headerFadeInOutController.show();
      });
    } else if (_currentPage.value == pages.length - 1) {
      _addFlightPageController.nextTab();
    }
  }
}
