import 'package:flight_booking_concept_ui/widgets/fading_item_list/fading_item_list_controller.dart';
import 'package:flutter/material.dart';

import '../../utils/r.dart';

class FadingItemList extends StatefulWidget {
  final List<Widget> listItems;
  final FadingItemListController fadingItemListController;

  const FadingItemList({
    Key? key,
    required this.listItems,
    required this.fadingItemListController,
  }) : super(key: key);

  @override
  State<FadingItemList> createState() => _FadingItemListState();
}

class _FadingItemListState extends State<FadingItemList>
    with TickerProviderStateMixin {
  late final Map<int, AnimatedListItemData> _listItemsMap = {};

  @override
  void initState() {
    super.initState();
    _initValues();
  }

  void _initValues() {
    for (int i = 0; i < widget.listItems.length; i++) {
      final itemAnimContr = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 200),
      );
      _listItemsMap[i] = AnimatedListItemData(
        _buildAnimatedListItem(widget.listItems[i], itemAnimContr),
        itemAnimContr,
      );

      widget.fadingItemListController.controllers =
          _listItemsMap.values.map((e) => e.animationController).toList();
    }
  }

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            itemCount: _listItemsMap.length,
            itemBuilder: (ctx, i) => _listItemsMap[i]!.widget,
          ),
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  R.primaryColor.withOpacity(0.0),
                  R.primaryColor,
                ],
              ),
            ),
          ),
        ],
      );

  Widget _buildAnimatedListItem(
    Widget listItem,
    AnimationController controller,
  ) =>
      AnimatedBuilder(
        animation: controller,
        builder: (ctx, child) => Opacity(
          opacity: controller.value * 1.0,
          child: listItem,
        ),
      );

  @override
  void dispose() {
    _listItemsMap.values.map((e) => e.animationController.dispose());
    super.dispose();
  }
}

class AnimatedListItemData {
  final Widget widget;
  final AnimationController animationController;

  AnimatedListItemData(this.widget, this.animationController);
}
