import 'package:emirates_airlines_concept_ui/resources/r.dart';
import 'package:flutter/material.dart';

class MyFlightsPage extends StatefulWidget {
  const MyFlightsPage({super.key});

  @override
  State<MyFlightsPage> createState() => _MyFlightsPageState();
}

class _MyFlightsPageState extends State<MyFlightsPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Map<int, AnimatedListItemData> _map = {};

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      final aC = AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
      _map[i] = AnimatedListItemData(_buildFlightItem(aC), aC);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 600,
      ),
    );
    _animationController.forward().whenComplete(
      () {
        for (int i = 0; i < 5; i++) {
          Future.delayed(Duration(milliseconds: 300 * i), () {
            _map[i]!.animationController.forward();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Icon(
            Icons.menu,
            color: R.primaryColor,
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

  Widget _buildFlightsListWidget() => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: R.primaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (ctx, i) => _map[i]!.widget,
              ),
            ),
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

  Widget _buildFlightItem(AnimationController controller) => AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Opacity(
          opacity: controller.value * 1.0,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DBC",
                            style: TextStyle(
                                color: R.secondaryColor, fontSize: 32.0),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "Dabaca",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            "DATE",
                            style: TextStyle(color: R.tertiaryColor),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "MAY 19, 8:35 AM",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            Icons.flight,
                            color: R.secondaryColor,
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "1h 35m",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "ADY",
                            style: TextStyle(
                                color: R.secondaryColor, fontSize: 32.0),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "Almedy",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Text(
                            "FLIGHT NO",
                            style: TextStyle(color: R.tertiaryColor),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "KB76",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.0,
                ),
                Divider(
                  color: R.secondaryColor,
                )
              ],
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
