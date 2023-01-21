import 'package:auto_scroll_listview/images_assets.dart';
import 'package:flutter/material.dart';

import 'listview_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController1 = ScrollController();
  final ScrollController _scrollController2 = ScrollController();
  final ScrollController _scrollController3 = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtend1 = _scrollController1.position.minScrollExtent;
      double maxScrollExtend1 = _scrollController1.position.maxScrollExtent;
      double minScrollExtend2 = _scrollController2.position.minScrollExtent;
      double maxScrollExtend2 = _scrollController2.position.maxScrollExtent;
      double minScrollExtend3 = _scrollController3.position.minScrollExtent;
      double maxScrollExtend3 = _scrollController3.position.maxScrollExtent;

      animateToRightLeft(
        max: maxScrollExtend1,
        min: minScrollExtend1,
        direction: maxScrollExtend1,
        duration: 25,
        scrollController: _scrollController1,
      );
      animateToRightLeft(
        max: maxScrollExtend2,
        min: minScrollExtend2,
        direction: maxScrollExtend2,
        duration: 15,
        scrollController: _scrollController2,
      );
      animateToRightLeft(
        max: maxScrollExtend3,
        min: minScrollExtend3,
        direction: maxScrollExtend3,
        duration: 20,
        scrollController: _scrollController3,
      );
    });
    super.initState();
  }

  void animateToRightLeft({
    required double max,
    required double min,
    required double direction,
    required int duration,
    required ScrollController scrollController,
  }) {
    scrollController
        .animateTo(
      direction,
      duration: Duration(seconds: duration),
      curve: Curves.linear,
    )
        .then(
      (value) {
        direction = direction == max ? min : max;

        animateToRightLeft(
          max: max,
          min: min,
          direction: direction,
          duration: duration,
          scrollController: scrollController,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 80,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListViewWidget(
              scrollController: _scrollController1,
              images: images1,
            ),
            ListViewWidget(
              scrollController: _scrollController2,
              images: images2,
            ),
            ListViewWidget(
              scrollController: _scrollController3,
              images: images3,
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              "30 days for free",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Material(
              color: const Color(0xfff2c94c),
              borderRadius: BorderRadius.circular(20),
              child: MaterialButton(
                onPressed: () {},
                minWidth: 340,
                height: 60,
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
