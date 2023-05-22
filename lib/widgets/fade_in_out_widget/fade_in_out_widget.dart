import 'package:flight_booking_concept_ui/widgets/fade_in_out_widget/fade_in_out_widget_controller.dart';
import 'package:flutter/material.dart';

const Duration kOpacityDuration = Duration(milliseconds: 300);
const Duration kSlideDuration = Duration(milliseconds: 300);
const Offset kSlideStartingOffset = Offset(0, 0);
const Offset kSlideEndingOffset = Offset(0, 1);

class FadeInOutWidget extends StatefulWidget {
  final Widget child;
  final bool initialVisibilityValue;
  final Duration? opacityDuration;
  final Duration? slideDuration;
  final Offset? slideStartingOffset;
  final Offset? slideEndingOffset;
  final FadeInOutWidgetController fadeInOutWidgetController;
  const FadeInOutWidget({
    super.key,
    required this.child,
    required this.fadeInOutWidgetController,
    this.initialVisibilityValue = true,
    this.opacityDuration,
    this.slideDuration,
    this.slideStartingOffset,
    this.slideEndingOffset,
  });

  @override
  State<FadeInOutWidget> createState() => _FadeInOutWidgetState();
}

class _FadeInOutWidgetState extends State<FadeInOutWidget>
    with SingleTickerProviderStateMixin {
  late final ValueNotifier<bool> _visibilityNotifier;
  late final Duration _opacityDuration;
  late final Duration _slideDuration;
  late final Offset _slideStartingOffset;
  late final Offset _slideEndingOffset;

  @override
  void initState() {
    super.initState();
    _visibilityNotifier = ValueNotifier(widget.initialVisibilityValue);
    _opacityDuration = widget.opacityDuration ?? kOpacityDuration;
    _slideDuration = widget.slideDuration ?? kSlideDuration;
    _slideStartingOffset = widget.slideStartingOffset ?? kSlideStartingOffset;
    _slideEndingOffset = widget.slideEndingOffset ?? kSlideEndingOffset;
    widget.fadeInOutWidgetController.notifier = _visibilityNotifier;
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: _visibilityNotifier,
        builder: (_, value, __) => AnimatedOpacity(
          duration: _opacityDuration,
          opacity: value ? 1.0 : 0.0,
          child: AnimatedSlide(
            duration: _slideDuration,
            offset: value ? _slideStartingOffset : _slideEndingOffset,
            child: widget.child,
          ),
        ),
      );
}
