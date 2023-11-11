import 'package:flutter/material.dart';
import 'package:itmc311/Pages/AdminPage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HomeSVPage extends StatelessWidget {
  const HomeSVPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                  child: const Text(
                    'Home',
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: const Icon(
                        Icons.person,
                        size: 30,
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      items: [
                        ...MenuItems.firstItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                        const DropdownMenuItem<Divider>(
                            enabled: false, child: Divider()),
                        ...MenuItems.secondItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: MenuItems.buildItem(item),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        MenuItems.onChanged(context, value! as MenuItem);
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 160,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(234, 247, 255, 1),
                        ),
                        offset: const Offset(0, 8),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: [
                          ...List<double>.filled(MenuItems.firstItems.length, 48),
                          8,
                          ...List<double>.filled(
                              MenuItems.secondItems.length, 48),
                        ],
                        padding: const EdgeInsets.only(left: 16, right: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 260,
              width: 320,
              margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
              child: Card(
                color: Colors.transparent,
                elevation: 10,
                shadowColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 0, 255, 1.0),
                        Color.fromRGBO(0, 0, 255, 0.80),
                        Color.fromRGBO(0, 0, 255, 0.30),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            'Available Parking Spaces',
                            style: TextStyle(
                              color: Color.fromRGBO(235, 235, 235, 1.0),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color.fromRGBO(235, 235, 235, 1.0),
                          thickness: 2.0,
                        ),
                        Text(
                          ParkingSpaceManager.availableParkingSpaces.toString(),
                          style: const TextStyle(
                            fontFamily: 'Arista',
                            fontSize: 125,
                            color: Color.fromRGBO(235, 235, 235, 1.0),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          alignment: Alignment.bottomRight,
                          child: const Text(
                            '**Approximately',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w200,
                              color: Color.fromRGBO(235, 235, 235, 0.50),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 10),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Parking Areas',
                  style: TextStyle(
                    color: Color.fromRGBO(10, 10, 31, 1),
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Alingal A',
                              style: TextStyle(
                                color: Color.fromRGBO(10, 10, 31, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ParkingArea(33),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Alingal B',
                              style: TextStyle(
                                color: Color.fromRGBO(10, 10, 31, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ParkingArea(7),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Church',
                              style: TextStyle(
                                color: Color.fromRGBO(10, 10, 31, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ParkingArea(7),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Coco Cafe',
                              style: TextStyle(
                                color: Color.fromRGBO(10, 10, 31, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ParkingArea(15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Covered Court',
                              style: TextStyle(
                                color: Color.fromRGBO(10, 10, 31, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ParkingArea(19),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Library',
                              style: TextStyle(
                                color: Color.fromRGBO(10, 10, 31, 1),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: ParkingArea(7),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingArea extends StatelessWidget {
  final int availableSpaces;

  ParkingArea(this.availableSpaces);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            availableSpaces.toString(),
            style: const TextStyle(
              fontFamily: 'Arista',
              fontSize: 45.0,
              color: Color.fromRGBO(10, 10, 31, 1),
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [user, help];
  static const List<MenuItem> secondItems = [logout];

  static const user = MenuItem(text: 'User', icon: Icons.person);
  static const help = MenuItem(text: 'Help', icon: Icons.help);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: const Color.fromRGBO(10, 10, 31, 1), size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Color.fromRGBO(10, 10, 31, 1),
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.user:
        //Do something
        break;
      case MenuItems.help:
        Navigator.pushNamed(context, '/help'); 
        break;
      case MenuItems.logout:
        Navigator.pushNamed(context, '/logout'); 
        break;
    }
  }
}