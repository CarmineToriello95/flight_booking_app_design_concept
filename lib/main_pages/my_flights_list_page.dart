import 'package:emirates_airlines_concept_ui/widgets/fading_item_list/fading_item_list_controller.dart';
import 'package:flutter/material.dart';

import '../widgets/fading_item_list/fading_item_list.dart';
import '../widgets/flights_list_item_widget.dart';

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

class MyFlightsListPage extends StatelessWidget {
  final FadingItemListController fadingItemListController;
  const MyFlightsListPage({
    super.key,
    required this.fadingItemListController,
  });

  @override
  Widget build(BuildContext context) => FadingItemList(
        fadingItemListController: fadingItemListController,
        listItems: List.generate(
          5,
          (index) => FlightsListItemWidget(
            flightData: flightsData[index],
          ),
        ),
      );
}
