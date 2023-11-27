import 'dart:async';

import 'package:flutter/material.dart';
import 'package:babylonjs_viewer/babylonjs_viewer.dart';

class MapSVPage extends StatefulWidget {
  const MapSVPage({super.key});

  @override
  State<MapSVPage> createState() => _MapSVPageState();
}

class _MapSVPageState extends State<MapSVPage> {
  List<Widget> carouselContent = [
    Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Alingal A',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
            ),
            BabylonJSViewer(src: "assets/Alingal-B.glb"),
          ],
        ),
      ],
    ),
    const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Alingal B',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Church',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Coco Cafe',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Covered Court',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Library',
                style: TextStyle(
                  fontSize: 26,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    // Add more content for additional carousels
  ];

  late final PageController pageController;
  int pageNum = 0;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 5), (timer) {
      if (pageNum == 5) {
        pageNum = 0;
      }

      pageController.animateToPage(pageNum,
          duration: const Duration(seconds: 5),
          curve: Curves.fastEaseInToSlowEaseOut);

      pageNum++;
    });
  }

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    carouselTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                child: const Text(
                  'Map',
                  style: TextStyle(
                    fontFamily: 'Arista',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                child: Icon(Icons.help_outline_rounded),
              ),
            ],
          ),
          SizedBox(
            height: 650,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                pageNum = index;
                setState(() {});
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                    onPanDown: (d) {
                      carouselTimer?.cancel();
                      carouselTimer = null;
                    },
                    onPanCancel: () {
                      carouselTimer = getTimer();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          index < carouselContent.length
                              ? carouselContent[index]
                              : Container(), // Add more conditions for additional content
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 6,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              6,
              (index) => Container(
                margin: EdgeInsets.all(2),
                child: Container(
                  height: 10,
                  width: 25,
                  decoration: BoxDecoration(
                    color: pageNum == index
                        ? Color.fromRGBO(0, 0, 255, 1.0)
                        : Color.fromRGBO(0, 0, 255, 0.50),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
