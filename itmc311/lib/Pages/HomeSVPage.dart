import 'package:flutter/material.dart';
import 'package:itmc311/Pages/AdminPage.dart';
import 'package:itmc311/Pages/GuidePage.dart';

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
                  child: IconButton(
                    icon: const Icon(Icons.help_outline_rounded),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const GuidePage();
                          },
                        ),
                      );
                    },
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
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Parking Areas',
                      style: TextStyle(
                        color: Color.fromRGBO(10, 10, 31, 1),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Tooltip(
                        message: 'Text',
                        waitDuration: Duration(seconds: 1),
                        showDuration: Duration(seconds: 2),
                        padding: EdgeInsets.all(12),
                        height: 35,
                        verticalOffset: 100,
                        preferBelow: true,
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10.0,
                                offset: Offset(6.0, 6.0),
                              ), //BoxShadow
                            ],
                            color: Colors.greenAccent[400]), //BoxDecoration
                        child:
                            const Icon(Icons.info_outline_rounded)), //Tooltip
                  ),
                ],
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
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 45, left: 75),
                                child: Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    width: 80,
                                    height: 80,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(35),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/AA-Pic.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 15),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(33),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 15),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Alingal A',
                                    style: TextStyle(
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                              'Burns',
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
            const SizedBox(
              height: 100,
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
