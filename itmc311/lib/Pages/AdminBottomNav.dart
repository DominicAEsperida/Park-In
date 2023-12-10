import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itmc311/Pages/AdminPage.dart';
import 'package:itmc311/Pages/MapSVPage.dart';

class AdminBottomNav extends StatefulWidget {
  const AdminBottomNav({super.key});

  @override
  State<AdminBottomNav> createState() => _AdminBottomNavState();
}

class _AdminBottomNavState extends State<AdminBottomNav> {
  int selectedIndex = 0;

  final screen = [
    AdminPage(),
    MapSVPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromRGBO(234, 247, 255, 1),
        body: screen[selectedIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: BottomAppBar(
              elevation: 0,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconBottomBar(
                          text: "Home",
                          icon: CupertinoIcons.house_fill,
                          selected: selectedIndex == 0,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
                        ),
                        IconBottomBar(
                          text: "Map",
                          icon: CupertinoIcons.map_fill,
                          selected: selectedIndex == 1,
                          onPressed: () {
                            setState(() {
                              selectedIndex = 1;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}


class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: selected ? 35 : 30,
              color: selected
                  ? Color.fromRGBO(0, 0, 255, 1.0)
                  : Color.fromRGBO(0, 0, 255, 0.50)),
        ),
        Padding(
          padding: selected ? EdgeInsets.only(left: 5) :  EdgeInsets.only(left: 3) ,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'BubbleboddyNeue',
              fontSize: selected ? 15 : 13,
              color: selected
                  ? Color.fromRGBO(0, 0, 255, 1.0)
                  : Color.fromRGBO(0, 0, 255, 0.50),
            ),
          ),
        )
      ],
    );
  }
}
