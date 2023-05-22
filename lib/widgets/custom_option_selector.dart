import 'package:flutter/material.dart';

import '../utils/r.dart';

class CustomOptionSelector extends StatefulWidget {
  final List<CustomOptionSelectorData> options;
  final Function(CustomOptionSelectorData?)? onOptionClicked;

  const CustomOptionSelector({
    Key? key,
    required this.options,
    this.onOptionClicked,
  }) : super(key: key);

  @override
  State<CustomOptionSelector> createState() => _CustomOptionSelectorState();
}

class _CustomOptionSelectorState extends State<CustomOptionSelector> {
  String? optionSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 60,
        width: double.infinity,
        child: Row(
          children: List.generate(
            widget.options.length,
            (id) => Expanded(
              child: _buildRouteSelector(
                option: widget.options[id],
              ),
            ),
          ),
        ),
      );

  Widget _buildRouteSelector({
    required CustomOptionSelectorData option,
  }) =>
      GestureDetector(
        onTap: () => setState(() {
          optionSelected = option.id;
          widget.onOptionClicked?.call(option);
        }),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: option.leftBorder
                  ? BorderSide(color: R.tertiaryColor)
                  : BorderSide.none,
              top: option.topBorder
                  ? BorderSide(color: R.tertiaryColor)
                  : BorderSide.none,
              right: option.rightBorder
                  ? BorderSide(color: R.tertiaryColor)
                  : BorderSide.none,
              bottom: option.bottomBorder
                  ? BorderSide(color: R.tertiaryColor)
                  : BorderSide.none,
            ),
          ),
          child: Center(
            child: Text(
              option.text,
              style: TextStyle(
                color:
                    isOptionSelected(option) ? R.secondaryColor : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  bool isOptionSelected(CustomOptionSelectorData option) =>
      option.id == optionSelected;
}

class CustomOptionSelectorData {
  final bool leftBorder;
  final bool topBorder;
  final bool rightBorder;
  final bool bottomBorder;
  final String text;
  final String id;

  CustomOptionSelectorData({
    required this.text,
    required this.id,
    this.leftBorder = true,
    this.topBorder = true,
    this.rightBorder = true,
    this.bottomBorder = true,
  });
}

class OptionData {
  final String id;
  final String text;

  OptionData(this.id, this.text);
}
