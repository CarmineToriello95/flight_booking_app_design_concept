import 'package:flight_booking_concept_ui/utils/r.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaysCalendarWidget extends StatefulWidget {
  final Function(DateTime)? onDayPressed;
  const DaysCalendarWidget({
    Key? key,
    this.onDayPressed,
  }) : super(key: key);

  @override
  State<DaysCalendarWidget> createState() => _DaysCalendarWidgetState();
}

class _DaysCalendarWidgetState extends State<DaysCalendarWidget> {
  late final ScrollController controller;
  late final ValueNotifier dateNotifier;
  late final List<DateTime> days;

  @override
  void initState() {
    super.initState();
    controller =
        ScrollController(initialScrollOffset: 60.0 * DateTime.now().day);
    dateNotifier = ValueNotifier(null);
    days = generateDays(month: DateTime.now());
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 80,
        child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (ctx, i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildDayWidget(
              day: days[i],
            ),
          ),
        ),
      );

  Widget _buildDayWidget({
    required DateTime day,
  }) =>
      GestureDetector(
        onTap: () {
          dateNotifier.value = day;
          widget.onDayPressed?.call(day);
        },
        child: ValueListenableBuilder(
            valueListenable: dateNotifier,
            builder: (_, value, __) {
              final bool isSelected = isDateSelected(
                day,
                value,
              );
              return Container(
                width: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? R.secondaryColor : R.tertiaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      daysMap[day.weekday].toString(),
                      style: TextStyle(
                        color: isSelected ? R.secondaryColor : R.tertiaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: isSelected ? R.secondaryColor : Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
      );

  List<DateTime> generateDays({
    required DateTime month,
  }) =>
      List.generate(
        month.daysInMonth,
        (index) => DateTime(month.year, month.month, 1).add(
          Duration(days: index),
        ),
      );

  bool isDateSelected(DateTime dateToCheck, DateTime? selectedDate) {
    if (selectedDate == null) return false;
    final formatter = DateFormat.yMd();
    final selectedDateString = formatter.format(selectedDate);
    final dateToCheckString = formatter.format(dateToCheck);
    return selectedDateString == dateToCheckString;
  }
}

const Map<int, String> daysMap = {
  1: "MON",
  2: "TUE",
  3: "WED",
  4: "THU",
  5: "FRI",
  6: "SAT",
  7: "SUN",
};

extension DaysInMonthExtension on DateTime {
  int get daysInMonth {
    return DateTime(year, month + 1, 1)
        .difference(DateTime(year, month, 1))
        .inDays;
  }
}
